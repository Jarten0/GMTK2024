class_name DoorKey

extends Scaleable

@export var door: LockedDoor
@export var car: CarInternal

func _on_area_2d_area_entered(area:Area2D) -> void:
	if area is CarInternal and car == null:
		area.KEY = self
		car = area

func _process(delta: float) -> void:
	if car != null:
		global_position = car.global_position + Vector2(-64, -64)