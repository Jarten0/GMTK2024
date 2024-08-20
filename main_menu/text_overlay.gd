extends Node2D

# @export var 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta
	if time >= 0.02:
		if displaying_text.length() > 0:
			displayed_text += displaying_text[0]
			displaying_text = displaying_text.substr(1)
		time = 0
	$Textbox/Label.text = displayed_text

var time: float = 0
var displayed_text: String = ""
var displaying_text: String = ""
var text: String = ""

func display_text(new_text: String):
	displaying_text = new_text
	text = new_text

func close_text():
	displaying_text = ""
	text = ""
	displayed_text = ""