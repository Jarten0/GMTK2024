extends Area2D


@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0
@export var GRID_SIZE = 128.0
@export var DIRECTION: Vector2 = Vector2.RIGHT
@export var STARTED: bool = false
var CURRENT_OVERLAPPING_TILE: TileData


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Start"):
		STARTED = true
		
	get_node("Sprite2D").rotation = DIRECTION.angle()
	#get_node("RayCast2D").rotation = DIRECTION.angle()
	#get_node("RayCast2D2").rotation = DIRECTION.angle()
	#get_node("RayCast2D3").rotation = DIRECTION.angle()
	# Get the input direction and handle the movement/deceleration.
	#if Input.is_action_just_pressed("ui_left"):
		#position.x -= GRID_SIZE
	#if Input.is_action_just_pressed("ui_right"):
		#position.x += GRID_SIZE
	#if Input.is_action_just_pressed("ui_up"):
		#position.y -= GRID_SIZE
	#if Input.is_action_just_pressed("ui_down"):
		#position.y += GRID_SIZE
		
	var tile_map_layer = ($".." as CarInterface).ROAD_LAYER
	var map_position = tile_map_layer.local_to_map($"..".position)
	CURRENT_OVERLAPPING_TILE = tile_map_layer.get_cell_tile_data(map_position)
	

func tick():
	if !visible or !STARTED:
		return
	
	if get_node("Sprite2D/RayCast2D").BLOCK_MOVEMENT or get_node("Sprite2D/RayCast2D2").BLOCK_MOVEMENT or get_node("Sprite2D/RayCast2D3").BLOCK_MOVEMENT:
		DIRECTION = DIRECTION.rotated(deg_to_rad(180))
		return
	
	$"..".position += DIRECTION.normalized() * GRID_SIZE / 2
	
	if (CURRENT_OVERLAPPING_TILE != null):
		var tile_type = CURRENT_OVERLAPPING_TILE.get_custom_data("Type")
		print(tile_type)

func on_body_entered(body: Node2D):
	if !visible:
		return
		
	print(body)
	
	check_for_tag(body)
	
func check_for_tag(body: Node2D):
	if !body.has_meta("Tag"):
		printerr("No tag metadata found")
		return
	
	match body.get_meta("Tag"):
		"Flag": 
			print("End of level")
			hide()
		"Spring":
			$"..".position += body.DIRECTION.normalized() * GRID_SIZE
		"TurnTile":
			DIRECTION = DIRECTION.rotated(deg_to_rad(90))
		"Wall":
			print("map collision")
		"Hazard":
			print("Died")
			hide()
		var tag:
			if tag != null:
				print("Unknown tag!: " + tag as String)
			else:
				print("Unknown tag!" )
