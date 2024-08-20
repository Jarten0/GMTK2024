extends Scaleable

@export var TURN_COUNTERCLOCKWISE = false
var shrink_progress: float = 0
var shrinking: bool = false
var scale_when_used: Vector2

func _process(delta: float) -> void:
    if shrinking:
        shrink_progress += delta
        rotation = shrink_progress
        $TurnTile.scale = scale_when_used * (1 - (shrink_progress * 2))
        if shrink_progress >= 0.5:
            queue_free() 

func on_use():
    shrinking = true
    scale_when_used = scale

