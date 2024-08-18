class_name Card

extends Area2D

@export var type: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.frame = type

func _mouse_shape_enter(shape_idx: int) -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass # Replace with function body.
