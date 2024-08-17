class_name Spring

extends Node

@export var DIRECTION: Vector2 = Vector2.ZERO
var ticks = 0

func _init() -> void:
	if (DIRECTION == Vector2.ZERO):
		DIRECTION = Vector2.from_angle(get_node(".").rotation).rotated(deg_to_rad(180))

func _physics_process(delta: float) -> void:
	if ticks > 0:
		$Sprite2D.frame = 1
		ticks -= 1
	else:
		$Sprite2D.frame = 0

func Activate():
	ticks = 5
