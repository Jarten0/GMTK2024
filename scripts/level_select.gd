extends Node2D

func load_level(level: int):
	get_parent().load_level(level)
	

func _on_level_1_pressed() -> void:
	get_parent().load_level(1)

func _on_level_2_pressed() -> void:
	get_parent().load_level(2)

func _on_level_3_pressed() -> void:
	get_parent().load_level(2)

func _on_level_4_pressed() -> void:
	get_parent().load_level(2)

func _on_btmm_pressed() -> void:
	get_parent().on_level_exit()
