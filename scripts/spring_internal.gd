class_name Spring

extends Node2D

var DIRECTION: Vector2 = Vector2.ZERO
var frame = 2

func _ready() -> void:
	DIRECTION = get_parent().PUSH_DIRECTION
	
func _physics_process(delta: float) -> void:
	if frame < 5:
		frame += 1 

	$ScaleableSprite.get_current_sprite().frame = clamp(frame - 3, 0, 2)

func Activate():
	frame = 0
