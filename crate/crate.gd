class_name Crate

extends Node2D



func _on_area_2d_area_entered(area:Area2D) -> void:
	if area is CarInternal:
		pass
	if area.get_parent() is Boulder:
		if area.get_parent().size > 1:
			queue_free()


	