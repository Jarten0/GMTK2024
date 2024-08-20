extends Button


var active = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if active: $Credits.position += (Vector2(-768, 488) - $Credits.position) * 0.2
	if !active: $Credits.position += (Vector2(0, -1000) - $Credits.position) * 0.2

func _on_pressed() -> void:
	active = !active
	visible = true
