class_name LockedDoor

extends Scaleable

var locked: bool = true
var unlocking: bool = false
var frame = 0
var frame_progress: float = 0.0

signal no_key()
signal key_too_big()
signal unlocked()

func unlock(key: DoorKey):
	if key == null:
		no_key.emit()
		return false
	
	if key.get_node("Area2D").scale != $Area2D.scale:
		key_too_big.emit()
		return false

	key.queue_free()
	unlocking = true
	unlocked.emit()
	
	return true

func _physics_process(delta: float) -> void:
	if unlocking and locked:
		frame_progress += delta
		if frame_progress >= 0.1:		
			frame += 1
			frame_progress = 0

		if frame >= 3:
			unlocking = false
			locked = false
			z_index = 0

	$Area2D/ScaleableSprite.get_current_sprite().frame = frame
