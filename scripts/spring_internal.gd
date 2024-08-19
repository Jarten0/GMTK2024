class_name Spring

extends Node2D

@export var DIRECTION: Vector2 = Vector2.ZERO
var frame = 2

func _init() -> void:
	if (DIRECTION == Vector2.ZERO):
		DIRECTION = Vector2.from_angle(global_rotation).rotated(deg_to_rad(-90))

func _physics_process(delta: float) -> void:
	if frame < 5:
		frame += 1 

	$ScaleableSprite.get_current_sprite().frame = clamp(frame - 3, 0, 2)

func Activate():
	frame = 0
