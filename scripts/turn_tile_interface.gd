extends Node2D

@export var TURN_COUNTERCLOCKWISE = false
var TURNTILE_ROTATION: float = 0
var shrink_progress: float = 0
var shrinking: bool = false
var init_scale: Vector2

func _process(delta: float) -> void:
    if shrinking:
        shrink_progress += delta
        rotation = shrink_progress
        scale = init_scale * (1 - (shrink_progress * 2))
        if shrink_progress >= 0.5:
            queue_free() 

func on_use():
    shrinking = true
    init_scale = scale