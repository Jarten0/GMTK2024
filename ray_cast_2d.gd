extends RayCast2D

@export var BLOCK_MOVEMENT = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	force_raycast_update()
	var collider = get_collider()
	#&& collider.get_meta("Tag") == "CollisionTileMap"
	if collider != null :
		BLOCK_MOVEMENT = true
	else:
		BLOCK_MOVEMENT = false
