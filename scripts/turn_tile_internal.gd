extends Area2D

var TURN_COUNTERCLOCKWISE: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	TURN_COUNTERCLOCKWISE = $"..".TURN_COUNTERCLOCKWISE
	if TURN_COUNTERCLOCKWISE:
		$ScaleableSprite.get_current_sprite().flip_h = true


func _on_area_entered(area:Area2D) -> void:
	if area.has_meta("Tag") and area.get_meta("Tag") != "Car":
		var parent = area.get_parent()
		if parent is Boulder:
			parent.turn_tile_rotate(TURN_COUNTERCLOCKWISE)

		# area.rotate(deg_to_rad(90) * sign(float(TURN_COUNTERCLOCKWISE) - 0.5))
		get_parent().on_use()
