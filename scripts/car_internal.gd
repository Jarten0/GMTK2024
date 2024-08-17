extends Area2D

@export var GRID_SIZE = 128.0
@export var DIRECTION: Vector2 = Vector2.RIGHT
@export var STARTED: bool = false
var TILEMAP_MANAGER: TileMapManager

func _ready() -> void:
	var TILEMAP_MANAGER: TileMapManager = $"..".TILEMAP_MANAGER

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Start"):
		STARTED = true

	$RotatingPart.rotation = DIRECTION.angle()
	
func get_tile_data(tile_map_layer: TileMapLayer) -> TileData:
	var map_position = tile_map_layer.local_to_map($"..".position)
	return tile_map_layer.get_cell_tile_data(map_position)

func tick():
	if !visible or !STARTED:
		return
	
	if $RotatingPart/RayCast2D.BLOCK_MOVEMENT or $RotatingPart/RayCast2D2.BLOCK_MOVEMENT or $RotatingPart/RayCast2D3.BLOCK_MOVEMENT:
		DIRECTION = DIRECTION.rotated(deg_to_rad(180))
		return
	
	$"..".position += DIRECTION.normalized() * GRID_SIZE / 2
	
func on_body_entered(body: Node2D):
	if !visible:
		return
	
	check_for_tag(body)
	
func check_for_tag(body: Node2D):
	if !body.has_meta("Tag"):
		printerr("No tag metadata found")
		return
	
	match body.get_meta("Tag"):
		"Flag": 
			print("End of level")
			hide()
			$"..".emit_signal("LevelComplete")
		"Spring":
			$"..".position += body.DIRECTION.normalized() * GRID_SIZE
			body.Activate()
		"TurnTile":
			if body.get_parent().TURN_COUNTERCLOCKWISE:
				DIRECTION = DIRECTION.rotated(deg_to_rad(-90))
			else:
				DIRECTION = DIRECTION.rotated(deg_to_rad(90))
		"Wall":
			print("Wall collision")
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
		"Path":
			if body.get_parent().VERTICAL:
				if DIRECTION.y == 0:
					DIRECTION.y = DIRECTION.x
				DIRECTION = Vector2(0, DIRECTION.y).normalized()
			else:
				if DIRECTION.x == 0:
					DIRECTION.x = DIRECTION.y
				DIRECTION = Vector2(DIRECTION.x, 0).normalized()
		var tag:
			if tag != null:
				print("Unknown tag!: " + tag as String)
			else:
				print("Unknown tag!" )
