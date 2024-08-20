class_name Boulder

extends Scaleable

@export var TILEMAP_MANAGER: TileMapManager
@export var AUTO_ROLL: bool = false
@export var DIRECTION: Vector2 = Vector2.ZERO
@export var INITIAL_SIZE: int = 2
var size: int = 2
var rolling = false
var current_frame: int = 0

var falling_from: Vector2
var fall_progress: float = 0
var falling: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if AUTO_ROLL:
		rolling = true
	$Area2D/ScaleableSprite.current_tile = INITIAL_SIZE
	size = INITIAL_SIZE


func on_collision(direction: Vector2):
	var l = ScaleableSprite.measure_scale(scale)
	if l <= 2:
		DIRECTION = direction 
		rolling = true

func on_collision_car(car: CarInterface):
	# print(car.SIZE.length(), " - " , SIZE.length())
	pass
	

func _physics_process(delta: float) -> void:
	size = $Area2D/ScaleableSprite.current_tile

	if falling:
		fall_progress += delta
		var falling_to = falling_from
		falling_to.y += 64 * 4
		position = falling_from.lerp(falling_to, pow(fall_progress, 2))
		
		if fall_progress >= 1:
			queue_free()

func tick():
	if falling:
		return

	if rolling:
		current_frame += 1
		if current_frame > 2:
			current_frame = 0

		position += DIRECTION.normalized() * 64
		
		if DIRECTION.x < 0:
			$Area2D/ScaleableSprite.get_current_sprite().frame_coords.x = 1
		else:
			$Area2D/ScaleableSprite.get_current_sprite().frame_coords.x = 0

		
	$Area2D/ScaleableSprite.get_current_sprite().frame_coords.y = current_frame 

	if get_tile_data(TILEMAP_MANAGER.FLOOR_LAYER) == null and get_tile_data_minus_one(TILEMAP_MANAGER.FLOOR_LAYER) == null:
		fall()



func _on_global_tick_timeout() -> void:
	tick()

func get_tile_data(tile_map_layer: TileMapLayer) -> TileData:
	var map_position = tile_map_layer.local_to_map(position / tile_map_layer.scale.x)
	return tile_map_layer.get_cell_tile_data(map_position)

func get_tile_data_minus_one(tile_map_layer: TileMapLayer) -> TileData:
	var map_position = tile_map_layer.local_to_map(position / tile_map_layer.scale.x) - Vector2i.ONE
	return tile_map_layer.get_cell_tile_data(map_position)

func fall():
	falling = true
	position += DIRECTION.normalized() * 64
	falling_from = position

func turn_tile_rotate(counterclockwise: bool):
	DIRECTION = DIRECTION.rotated(deg_to_rad(-90) * sign(float(counterclockwise) - 0.5))

func _on_area_2d_body_entered(body:Node2D) -> void:
	# print("something collided with boulder" + body.get_path().get_concatenated_names())
	var parent = body.get_parent() 
	var tag = "None"
	if body.has_meta("Tag"):
		tag = body.get_meta("Tag")
	if body is CarInternal:
		on_collision_car(body.get_parent())
	elif parent is Crate:
		if parent.get_node("Area2D/ScaleableSprite").current_tile > 2:
			# DIRECTION *= -1
			position += DIRECTION.normalized() * 64
	elif parent is DoorKey:
		print('push')
		parent.position += DIRECTION.normalized() * 64
	elif tag == "Wall":
		position -= DIRECTION.normalized() * 64
		DIRECTION = Vector2.ZERO


	# elif body is Area2D:
	# 	if body.get_collision_layer_value(1):
	# 		DIRECTION *= -1
	# 		position += DIRECTION.normalized() * 64
			
