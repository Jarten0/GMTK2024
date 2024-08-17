extends Node

@export var SCALE_LIMIT = 4.0
@export var OTHER_NODE: Area2D = null


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	var node = OTHER_NODE
	if node == null:
		printerr("No other node found")
		return
		
	if event.is_action_pressed("ScaleUp"):
		node.scale *= 2
		node.scale = node.scale.normalized() * clampf(node.scale.length(), 0.5, SCALE_LIMIT)

	if event.is_action_pressed("ScaleDown"):
		node.scale /= 2
		node.scale = node.scale.normalized() * clampf(node.scale.length(), 0.5, SCALE_LIMIT)
