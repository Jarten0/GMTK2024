class_name Crate

extends Scaleable

func _on_area_2d_area_entered(area:Area2D) -> void:
	if area is CarInternal:
		pass
	if area.get_parent() is Boulder:
		if area.get_parent().SIZE >= SIZE:
			queue_free()
