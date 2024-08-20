extends LevelSignals

@export var stage: int = 0

func _ready() -> void:
	$Control/PhoneOverlay.display_text(Dialog.lines[29])


func _process(delta: float) -> void:
	$Control/PhoneOverlay.position = $Camera2D.position

func stage_one():
	stage = 1
	$Control/PhoneOverlay.close_text()
	$Control/PhoneOverlay.display_text(Dialog.lines[30])

func stage_two():
	stage = 2
	$Control/PhoneOverlay.close_text()
	$Control/PhoneOverlay.display_text(Dialog.lines[31])

func end():
	LevelComplete.emit()