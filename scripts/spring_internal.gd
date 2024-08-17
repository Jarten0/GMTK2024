class_name Spring

extends Node

@export var DIRECTION: Vector2 = Vector2.ZERO

func _init() -> void:
	if (DIRECTION == Vector2.ZERO):
		DIRECTION = Vector2.from_angle(get_node(".").rotation).rotated(deg_to_rad(180))
