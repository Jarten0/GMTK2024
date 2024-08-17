extends Button


func _on_pressed() -> void:
	get_tree().quit()


func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/pt.tscn")


func _on_load_level_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/LevelSelect.tscn")
