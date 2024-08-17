extends Node

@export var SCALE_LIMIT = 4.0

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	var node = get_node("..")
	if event.is_action_pressed("ScaleUp"):
		node.scale *= 1.5
		node.scale = node.scale.normalized() * clampf(node.scale.length(), 0.5, SCALE_LIMIT)

	if event.is_action_pressed("ScaleDown"):
		node.scale /= 1.5
		node.scale = node.scale.normalized() * clampf(node.scale.length(), 0.5, SCALE_LIMIT)
