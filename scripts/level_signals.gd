class_name LevelSignals

extends Node2D

@export var CARDS: Array[int]
@export var CARD_ROW_POS: Vector2 = Vector2(128, 960)

signal LevelComplete()
signal LevelReset()
signal LevelExit()

func _on_car_level_complete() -> void:
	emit_signal("LevelComplete")
	
func _on_car_level_exit() -> void:
	emit_signal("LevelExit")

func _on_car_level_restart() -> void:
	emit_signal("LevelReset")
