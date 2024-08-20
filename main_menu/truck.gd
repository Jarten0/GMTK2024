extends Sprite2D

@export var CAMERA: Camera2D


@export var timer: Timer

func _ready() -> void:
	timer.wait_time = 0.1
	timer.connect("timeout", timeout)
	timer.start()


func _process(delta: float) -> void:
	match get_parent().stage:
		0:
			position.x += delta * 1200
			if position.x > 200:
				CAMERA.position.x = position.x - 200
			
			if CAMERA.position.x >= 3840:
				CAMERA.position.x = 3840
				get_parent().stage_one()
		1:
			if position.x > 6320:
				position.x = 6320
				flip_h = true
				timer.disconnect("timeout", timeout)
				timer.connect("timeout", takeoff)
				timer.wait_time = 2.5
				timer.one_shot = true
				timer.start()
			elif position.x < 6320:
				position.x += delta * 1200
		2:
			position.y = $"../Rocket".position.y
			pass

func takeoff():
	get_parent().stage_two()
	rotation_degrees -= 25
	pass

func timeout():
	if position.y == 1472:
		position.y += 2
	else:
		position.y = 1472
