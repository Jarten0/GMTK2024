class_name CarInternal

extends Area2D

@export var GRID_SIZE = 128.0
@export var DIRECTION: Vector2i = Vector2i.RIGHT
@export var STARTED: bool = false
@export var turns: int = 2 

var TILEMAP_MANAGER: TileMapManager
var unpathable: int = 0
var previous_direction: Vector2i
var visible_sprite: int = 0
var size: int = 2
var anim_delta: float = 0.0
var KEY: DoorKey

func _ready():
	if TILEMAP_MANAGER == null:
		TILEMAP_MANAGER = $"..".TILEMAP_MANAGER
	
func _physics_process(delta: float) -> void:
	if turns > 0:
		if Input.is_action_just_pressed("left"): 
			DIRECTION = Vector2.LEFT
			turns -= 1
			unpathable = 2
		if Input.is_action_just_pressed("right"): 
			DIRECTION = Vector2.RIGHT
			turns -= 1
			unpathable = 2
		if Input.is_action_just_pressed("up"): 
			DIRECTION = Vector2.UP
			turns -= 1
			unpathable = 2
		if Input.is_action_just_pressed("down"): 
			DIRECTION = Vector2.DOWN
			turns -= 1
			unpathable = 2

	var manager = get_tree().root.get_node("LevelManager")
	if manager != null:
		manager.turns_left = turns

	anim_delta += delta

	if Input.is_action_just_pressed("Start"):
		STARTED = true
		$"..".TIMER.start()

	if DIRECTION == previous_direction: 
		$RotatingPart.rotation = (DIRECTION as Vector2).angle()
	
	if STARTED and anim_delta > 0.1:
		anim_delta = 0
		$Sprites/Small.frame = abs(sign($Sprites/Small.frame) - 1)

	update_visible_sprite()

func get_tile_data(tile_map_layer: TileMapLayer) -> TileData:
	var map_position = tile_map_layer.local_to_map($"..".position / tile_map_layer.scale.x)
	return tile_map_layer.get_cell_tile_data(map_position)



func tick():
	if !visible or !STARTED:
		return

	if DIRECTION != previous_direction: 
		previous_direction = DIRECTION
	
		
	if unpathable > 0:
		unpathable -= 1

	$"..".position += DIRECTION * GRID_SIZE / 2
	
	update_visible_sprite()
	
	if get_tile_data(TILEMAP_MANAGER.FLOOR_LAYER) == null:
		fall()

func on_body_entered(body: Node2D):
	if !visible:
		return
	
	check_for_tag(body)
	
func check_for_tag(body: Node2D):
	if !body.has_meta("Tag"):
		# print("No tag metadata found for" + body.to_string())
		return
	
	match body.get_meta("Tag"):
		"Flag": 
			$"..".emit_signal("LevelComplete")
		"Spring":
			$"..".position += body.DIRECTION * GRID_SIZE
			body.Activate()
		"TurnTile":
			if body.get_parent().TURN_COUNTERCLOCKWISE:
				DIRECTION = (DIRECTION as Vector2).rotated(deg_to_rad(-90))
			else:
				DIRECTION = (DIRECTION as Vector2).rotated(deg_to_rad(90))
			unpathable = 3
			body.get_parent().on_use()
		"Wall":
			print("Wall collision")
			DIRECTION = (DIRECTION as Vector2).rotated(deg_to_rad(180))
			get_parent().position += DIRECTION * GRID_SIZE / 2
		"LockedDoor":
			if !body.get_parent().unlock(KEY): # if door fails to unlock
				DIRECTION = (DIRECTION as Vector2).rotated(deg_to_rad(180))
			else:
				KEY = null
		"Boulder":
			if body.get_parent().size != 1:
				DIRECTION = (DIRECTION as Vector2).rotated(deg_to_rad(180))
			else:
				body.get_parent().position += DIRECTION * GRID_SIZE / 2
		"ObjectLayer":
			var tiledata = get_tile_data(TILEMAP_MANAGER.OBJECT_LAYER)
			if tiledata == null:
				return
			var type = tiledata.get_custom_data("Type")
			if type == null:
				return
			match type as String:
				"Hazard":
					print("Died")
					hide()
					$"..".emit_signal("LevelRestart")
				null:
					printerr("null?")
		var tag:
			if tag != null:
				print("Unknown tag!: " + tag as String)
			else:
				print("Unknown tag!")


func _on_path_tracker_area_entered(area: Area2D) -> void:
	if unpathable > 0:
		return
	
	var path = area.get_parent()
	
	if path is PathCorner:		
		if Vector2i(path.EXIT * -1) == Vector2i(DIRECTION):
			DIRECTION = path.ENTER * -1
		else:
			DIRECTION = path.EXIT
		return
	else:
		check_for_tag(area)

var falling_from: Vector2
var fall_progress: float = 0
var falling: bool = false

func _process(delta: float) -> void:
	if falling:
		monitoring = false
		monitorable = false
		fall_progress += delta
		var falling_to = falling_from
		falling_to.y += 64 * 4
		position = falling_from.lerp(falling_to, pow(fall_progress, 2))
		
		if fall_progress >= 1:
			$"..".emit_signal("LevelRestart")

func fall():
	falling = true
	position += DIRECTION as Vector2 * 64
	falling_from = position
	z_index = -10
	get_parent().TIMER.stop()

func update_visible_sprite():
	var sprite: Sprite2D = $Sprites/Small
	sprite.hframes = 2
	size = ScaleableSprite.measure_scale(scale)
	if size == 3:
		sprite.region_rect = Rect2(128, 0, 128, 64)
		sprite.scale = Vector2.ONE / 2
	else:
		sprite.region_rect = Rect2(0, 0, 64, 32)
		sprite.region_rect.position.x = (size * 64) - 64
		sprite.scale = Vector2.ONE


	if DIRECTION.x != 0:
		sprite.region_rect.position.y += 128
		if DIRECTION.x < 0:
			sprite.region_rect.position.y += 64
	elif DIRECTION.y < 0:
		sprite.region_rect.position.y += 64
