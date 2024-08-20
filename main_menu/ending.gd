extends Node2D

@export var stage: int = 0

func _ready() -> void:
	$Control/PhoneOverlay.display_text(Dialog.lines[29])


func _process(delta: float) -> void:
	$Control/PhoneOverlay.position = $Camera2D.position

