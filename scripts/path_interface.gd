extends Node2D

@export var VERTICAL: bool = false
@export var DIAGONAL: bool = false

func _ready() -> void:
	if VERTICAL:
		rotate(deg_to_rad(90))
