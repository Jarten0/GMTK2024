extends Sprite2D

@onready var BASE_POSITION = position
@onready var BASE_ROTATION = rotation
@onready var BASE_SCALE = scale

@onready var TARGET_POSITION = global_position
@onready var TARGET_ROTATION = global_rotation
@onready var TARGET_SCALE = global_scale

@export var POSITION_RATE: float = 1.0
@export var ROTATION_RATE: float = 1.0
@export var SCALE_RATE: float = 1.0

var position_progress = 0.0
var rotation_progress = 0.0
var scale_progress = 0.0

func _ready() -> void:
	global_position = $"..".global_position + BASE_POSITION
	global_rotation = $"..".global_rotation + BASE_ROTATION
	global_scale = $"..".global_scale + BASE_SCALE

func _on_car_tick() -> void:
	position_progress = 0.0
	rotation_progress = 0.0
	scale_progress = 0.0


func _process(delta: float) -> void:
	TARGET_POSITION = $"..".global_position + BASE_POSITION
	TARGET_ROTATION = $"..".global_rotation + BASE_ROTATION
	TARGET_SCALE = $"..".global_scale + BASE_SCALE
	
	position_progress = clamp((position_progress + delta) * POSITION_RATE, 0, 1)
	rotation_progress = clamp((rotation_progress + delta) * ROTATION_RATE, 0, 1)
	scale_progress = clamp((scale_progress + delta) * SCALE_RATE, 0, 1)

	global_position = global_position.lerp(TARGET_POSITION, position_progress)
	global_rotation = lerp(global_rotation, TARGET_ROTATION, rotation_progress)
	global_scale = global_scale.lerp(TARGET_SCALE, scale_progress)
