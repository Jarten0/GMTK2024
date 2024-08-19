class_name ScaleableSprite

extends Node

@export var small_tile: Sprite2D
@export var medium_tile: Sprite2D
@export var large_tile: Sprite2D

var small_base_scale
var medium_base_scale
var large_base_scale

var current_tile: int = 2

func get_current_sprite():
	match current_tile:
		0: return null
		1: return small_tile
		2: return medium_tile
		3: return large_tile
		_: return null

func _ready() -> void:
	small_base_scale = small_tile.scale
	medium_base_scale = medium_tile.scale
	large_base_scale = large_tile.scale
	small_tile.visible = false
	medium_tile.visible = false
	large_tile.visible = false
	current_tile = 0

const ROOT_OF_2 = sqrt(2)

func _process(delta: float) -> void:
	var parent_scale = $"..".scale
	match parent_scale:
		var scale when parent_scale.x < 1 or parent_scale.y < 1: 
			current_tile = 1
			small_tile.visible = true
			large_tile.visible = false
			medium_tile.visible = false
			small_tile.global_position = $"..".global_position
			small_tile.global_rotation = $"..".global_rotation
			small_tile.scale = small_base_scale * scale
		var scale when parent_scale.x >= 2 and parent_scale.y >= 2: 
			current_tile = 3
			large_tile.visible = true
			small_tile.visible = false
			medium_tile.visible = false
			large_tile.global_position = $"..".global_position
			large_tile.global_rotation = $"..".global_rotation
			large_tile.scale = large_base_scale * scale
		var scale:
			current_tile = 2
			medium_tile.visible = true
			large_tile.visible = false
			small_tile.visible = false
			medium_tile.global_position = $"..".global_position
			medium_tile.global_rotation = $"..".global_rotation
			medium_tile.scale = medium_base_scale * scale
			
static func measure_scale(parent_scale: Vector2i):
	match parent_scale * 1.001:
		var _scale when parent_scale.x < 1 or parent_scale.y < 1: 
			return 1
			
		var _scale when parent_scale.x >= 2 and parent_scale.y >= 2: 
			return 3
			
		var _scale:
			return 2
			