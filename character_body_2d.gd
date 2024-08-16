extends Area2D


@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0
@export var GRID_SIZE = 128.0
@export var DIRECTION: Vector2 = Vector2.RIGHT



func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	if Input.is_action_just_pressed("ui_left"):
		position.x -= GRID_SIZE
	if Input.is_action_just_pressed("ui_right"):
		position.x += GRID_SIZE
	if Input.is_action_just_pressed("ui_up"):
		position.y -= GRID_SIZE
	if Input.is_action_just_pressed("ui_down"):
		position.y += GRID_SIZE

func tick():
	position += DIRECTION.normalized() * GRID_SIZE
	pass

func on_body_entered(body: Area2D):
	if body.get_collision_layer_value(3) == true:
		print("hehe")
	else:
		print("neh")
	pass
