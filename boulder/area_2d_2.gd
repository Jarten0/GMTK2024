extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func turn_tile_rotate(counterclockwise: bool):
	get_parent().get_parent().turn_tile_rotate(counterclockwise)

