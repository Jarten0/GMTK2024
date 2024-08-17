extends Area2D

var TURN_COUNTERCLOCKWISE

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	TURN_COUNTERCLOCKWISE = $"..".TURN_COUNTERCLOCKWISE
	if TURN_COUNTERCLOCKWISE:
		$Sprite2D.flip_h = true
