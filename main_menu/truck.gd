extends Sprite2D

@export var CAMERA: Camera2D


var anim_timer: Timer = Timer.new()

func _ready() -> void:
	anim_timer.wait_time = 0.1
	anim_timer.connect("timeout", timeout)
	anim_timer.start()


func _process(delta: float) -> void:
	match get_parent().stage:
		0:
			position.x += delta * 1200
			if position.x > 200:
				CAMERA.position.x = position.x - 200
			
			if CAMERA.position.x >= 3840:
				CAMERA.position.x = 3840
				get_parent().stage += 1
		1:
			position.x += delta * 1200
			
				

func timeout():
	if position.y == 1472:
		position.y += 2
	else:
		position.y = 1472
