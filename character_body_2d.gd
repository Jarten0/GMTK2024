extends Area2D


@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0
@export var GRID_SIZE = 128.0
@export var DIRECTION: Vector2 = Vector2.RIGHT
@export var STARTED: bool = false


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Start"):
		STARTED = true
		
	(get_node("Sprite2D") as Node2D).rotation = DIRECTION.angle()


	# Get the input direction and handle the movement/deceleration.
	#if Input.is_action_just_pressed("ui_left"):
		#position.x -= GRID_SIZE
	#if Input.is_action_just_pressed("ui_right"):
		#position.x += GRID_SIZE
	#if Input.is_action_just_pressed("ui_up"):
		#position.y -= GRID_SIZE
	#if Input.is_action_just_pressed("ui_down"):
		#position.y += GRID_SIZE

func tick():
	if !visible or !STARTED:
		return

	position += DIRECTION.normalized() * GRID_SIZE

func on_body_entered(body: Area2D):
	if !visible:
		return
		
	match body.get_meta("Tag"):
		"Flag": 
			print("End of level")
			hide()
		"Spring":
			position += (body as Spring).DIRECTION.normalized() * GRID_SIZE
		"TurnTile":
			DIRECTION = DIRECTION.rotated(deg_to_rad(90))
	
