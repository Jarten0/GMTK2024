extends LevelSignals


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if LEVEL_MANAGER.completed:
		$Control/TextureRect.position.x = 448 + 576
		$Control/Polygon2D.visible = false
		$Control/Label.visible = true
