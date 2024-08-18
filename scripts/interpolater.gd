extends Sprite2D

@onready var BASE_POSITION = position
@onready var BASE_ROTATION = rotation
@onready var BASE_SCALE = scale

@onready var TARGET_POSITION = global_position
@onready var TARGET_ROTATION = global_rotation
@onready var TARGET_SCALE = global_scale

@export var RATE: float = 1.0

var time = 0.0

func _ready() -> void:
	global_position = $"..".global_position + BASE_POSITION
	global_rotation = $"..".global_rotation + BASE_ROTATION
	global_scale = $"..".global_scale + BASE_SCALE

func _on_car_tick() -> void:
	time = 0.0

func _process(delta: float) -> void:
	TARGET_POSITION = $"..".global_position + BASE_POSITION
	TARGET_ROTATION = $"..".global_rotation + BASE_ROTATION
	TARGET_SCALE = $"..".global_scale + BASE_SCALE
	
	time = clamp(time + delta * RATE, 0, 1)
	global_position = global_position.lerp(TARGET_POSITION, time)
	global_rotation = lerp(global_rotation, TARGET_ROTATION, time)
	global_scale = global_scale.lerp(TARGET_SCALE, time)
	
