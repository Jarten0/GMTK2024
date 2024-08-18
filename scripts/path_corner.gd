class_name PathCorner

extends Node2D

@export var ENTER: Vector2i = Vector2.UP
@export var EXIT: Vector2i = Vector2.RIGHT

func _ready() -> void:
	ENTER = (ENTER as Vector2).normalized()
	EXIT = (EXIT as Vector2).normalized()
