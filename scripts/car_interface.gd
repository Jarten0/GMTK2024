class_name CarInterface

extends Node2D

@export var TILEMAP_MANAGER: TileMapManager 

signal LevelComplete()
signal LevelRestart()
signal LevelExit()

func _on_global_tick_timeout() -> void:
	get_node("Car").tick()
