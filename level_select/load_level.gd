extends Button

@export var level: int = 1

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			%Control.get_parent().load_level(level)
