extends AudioStreamPlayer

@export var TRACKS: Array[AudioStreamWAV]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if TRACKS.size() > 0:
		stream = TRACKS[0]
		play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
