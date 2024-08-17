class_name TileMapManager

extends Node2D

@export var ROAD_LAYER: TileMapLayer
@export var WALL_LAYER: TileMapLayer
@export var OBJECT_LAYER: TileMapLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if ROAD_LAYER == null:
		ROAD_LAYER = $RoadLayer
	if WALL_LAYER == null:
		WALL_LAYER = $WallLayer
	if OBJECT_LAYER == null:
		OBJECT_LAYER = $ObjectLayer
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
