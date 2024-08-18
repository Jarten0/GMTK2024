extends Area2D

@export var SCALE_LIMIT = 8.0
@export var OTHER_NODE: Area2D = null

func _ready() -> void:
	if OTHER_NODE == null:
		OTHER_NODE = $"../Area2D"

func scale_up():
	var node = OTHER_NODE
	node.scale *= 2
	node.scale = node.scale.normalized() * clampf(node.scale.length(), 0.5, SCALE_LIMIT)

func scale_down():
	var node = OTHER_NODE
	node.scale /= 2
	node.scale = node.scale.normalized() * clampf(node.scale.length(), 0.5, SCALE_LIMIT)

func scale_up_x():
	var node = OTHER_NODE
	node.scale.x *= 2
	node.scale.x = clampf(node.scale.x, 0.5, SCALE_LIMIT)

func scale_down_x():
	var node = OTHER_NODE
	node.scale.x /= 2
	node.scale.x = clampf(node.scale.x, 0.5, SCALE_LIMIT)

func scale_up_y():
	var node = OTHER_NODE
	node.scale.y *= 2
	node.scale.y = clampf(node.scale.y, 0.5, SCALE_LIMIT)

func scale_down_y():
	var node = OTHER_NODE
	node.scale.y /= 2
	node.scale.y = clampf(node.scale.y, 0.5, SCALE_LIMIT)
