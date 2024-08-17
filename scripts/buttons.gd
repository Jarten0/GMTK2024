extends Button

func _on_pressed() -> void:
	get_tree().quit()

func _on_new_game_pressed() -> void:
	get_tree().root.get_node("LevelManager").load_level(1)

func _on_load_level_pressed() -> void:
	get_tree().root.get_node("LevelManager").level_select()
