extends AudioStreamPlayer

@export var TRACKS: Array[AudioStreamWAV]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if TRACKS.size() > 0:
		stream = TRACKS[0]
		play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var level_manager: LevelManager = $".."
	if !has_stream_playback():
		if (level_manager.level_index > 0 and level_manager.level_index <= 3) :
			stream = TRACKS[1]
			play()
		elif (level_manager.level_index > 3 and level_manager.level_index <= 6) :
			stream = TRACKS[2]
			play()
		elif level_manager.level_index == 0:
			stream = TRACKS[0]
			play()
		
		
