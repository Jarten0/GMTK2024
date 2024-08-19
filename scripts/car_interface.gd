class_name CarInterface

extends Node2D

@export var TILEMAP_MANAGER: TileMapManager 
@export var TIMER: Timer

signal LevelComplete()
signal LevelRestart()
signal LevelExit()

signal Tick()

func _on_global_tick_timeout() -> void:
	emit_signal("Tick")
