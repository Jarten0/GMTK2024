extends Node2D

@export var TILEMAP_MANAGER: TileMapManager
@export var AUTO_ROLL: bool = false
@export var DIRECTION: Vector2 = Vector2.ZERO
@export var size: int = 2
var rolling = false
var current_frame: int = 0

var falling_from: Vector2
var fall_progress: float = 0
var falling: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if AUTO_ROLL:
		rolling = true
	
func on_collision(direction: Vector2):
	if size <= 2:
		DIRECTION = direction * -1
		rolling = true

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

	if get_tile_data(TILEMAP_MANAGER.FLOOR_LAYER) == null:
		fall()

func _on_area_2d_area_entered(area:Area2D) -> void:
	if area is CarInternal:
		on_collision(area.DIRECTION)

func _on_global_tick_timeout() -> void:
	tick()

func get_tile_data(tile_map_layer: TileMapLayer) -> TileData:
	var map_position = tile_map_layer.local_to_map(position / tile_map_layer.scale.x)
	return tile_map_layer.get_cell_tile_data(map_position)

func fall():
	falling = true
	position += DIRECTION.normalized() * 64
	falling_from = position