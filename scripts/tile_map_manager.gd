class_name TileMapManager

extends Node2D

@export var FLOOR_LAYER: TileMapLayer
@export var ROAD_LAYER: TileMapLayer
@export var WALL_LAYER: TileMapLayer
@export var OBJECT_LAYER: TileMapLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if FLOOR_LAYER == null:
		FLOOR_LAYER = $Floor
	if ROAD_LAYER == null:
		ROAD_LAYER = $Road
	if WALL_LAYER == null:
		WALL_LAYER = $Wall
	if OBJECT_LAYER == null:
		OBJECT_LAYER = $Object
