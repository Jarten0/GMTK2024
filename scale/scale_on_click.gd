class_name CardReciever

extends Area2D

var SCALE_LIMIT = (Vector2.ONE * 4).length()
@export var OTHER_NODE: Area2D = null

func _ready() -> void:
	SCALE_LIMIT = (Vector2.ONE * 4).length()
	if OTHER_NODE == null:
		OTHER_NODE = $"../Area2D"

func scale_up():
	var node = OTHER_NODE
	assert(OTHER_NODE != null, "No other node found!")
	if node.scale.x > 2:
		node.scale.y *= 2
	elif node.scale.y > 2:
		node.scale.x *= 2
	else:
		node.scale *= 2
	node.scale = node.scale.normalized() * clampf(node.scale.length(), 0.5, SCALE_LIMIT)

func scale_down():
	var node = OTHER_NODE
	if node.scale.x < 1:
		node.scale.y /= 2
	elif node.scale.y < 1:
		node.scale.x /= 2
	else:
		node.scale /= 2
	node.scale = node.scale.normalized() * clampf(node.scale.length(), 0.5, SCALE_LIMIT)

func scale_jumbo():
	var node = OTHER_NODE
	node.scale = Vector2.ONE * 4

func scale_mini():
	var node = OTHER_NODE
	node.scale = Vector2.ONE * 0.5

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
