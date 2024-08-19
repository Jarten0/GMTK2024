extends Node2D

@export var AUTO_ROLL: bool = false
@export var DIRECTION: Vector2 = Vector2.ZERO
@export var size: int = 2
var rolling = false
var current_frame: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if AUTO_ROLL:
		rolling = true
	
func on_collision(direction: Vector2):
	if size <= 2:
		DIRECTION = direction
		rolling = true

func tick():
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
	size = $Area2D/ScaleableSprite.current_tile

func _on_area_2d_area_entered(area:Area2D) -> void:
	if area is CarInternal:
		on_collision(area.DIRECTION)


func _on_global_tick_timeout() -> void:
	tick()
