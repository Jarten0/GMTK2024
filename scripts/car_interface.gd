class_name CarInterface

extends Node2D

@export var ROAD_LAYER: TileMapLayer

func _on_global_tick_timeout() -> void:
	get_node("Car").tick()
