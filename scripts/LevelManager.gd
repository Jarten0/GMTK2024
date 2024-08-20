class_name LevelManager

extends Node2D

@export var InitialScene: PackedScene
@export var LevelSelect: PackedScene
@export var PackedSceneLevels: Array[PackedScene]
@onready var BGM: AudioStreamPlayer = $BGM

var current_level: Node
var level_index: int = 0
var turns_left: int = 0
var completed: bool = false
signal loaded_level(index: int)

func load_level(index: int):
	if (level_index > 0 and level_index <= 3) and (!index > 0 and !index <= 3):
		BGM.stream = BGM.TRACKS[1]
		BGM.play()
	elif (level_index > 3 and level_index <= 6) and (!level_index > 3 and !level_index <= 6):
		BGM.stream = BGM.TRACKS[2]
		BGM.play()
	elif level_index == 0 and (index != 0 and index != 7):
		BGM.stream = BGM.TRACKS[0]
		BGM.play()
	level_index = index
	if current_level != null:
		current_level.queue_free()
	current_level = PackedSceneLevels[index].instantiate(PackedScene.GEN_EDIT_STATE_DISABLED)
	add_child(current_level)

	loaded_level.emit(index)
	

	if current_level is LevelSignals:
		current_level.LevelComplete.connect(on_level_complete)
		current_level.LevelExit.connect(on_level_exit)
		current_level.LevelReset.connect(on_level_restart)
		%CardRow.position = current_level.CARD_ROW_POS
		%CardRow.setup(current_level.CARDS)
		

	if index != 0:
		$UI.visible = true


func load_level_from_packed_scene(scene: PackedScene):
	if current_level != null:
		current_level.queue_free()
	current_level = scene.instantiate(PackedScene.GEN_EDIT_STATE_DISABLED)
	add_child(current_level)
	
	if current_level is LevelSignals:
		current_level.LevelComplete.connect(on_level_complete)
		current_level.LevelExit.connect(on_level_exit)
		current_level.LevelReset.connect(on_level_restart)
		%CardRow.position = current_level.CARD_ROW_POS 
		%CardRow.setup(current_level.CARDS)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_level_from_packed_scene(InitialScene)
	var array: Array[int] = [0,1,2,3,4,5]
	%CardRow.setup(array)
	$UI.visible = false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Restart"):
		on_level_restart()
	if Input.is_action_just_pressed("Exit"):
		on_level_exit()
	$UI/Counter2.text = String.num_int64(turns_left)
	if Input.is_key_pressed(KEY_F10):
		on_level_complete()
	# if $LevelTransition.frame == 7 and $LevelTransition.animation == "wipe":
	# 	$LevelTransition.play("clean")
	# 	$LevelTransition.stop()


func on_level_complete():
	$LevelCompleteDelay.start(1.9)
	current_level.get_node("Global Tick").start(0.1)
	
var timer : Timer

func _on_level_complete_delay_timeout() -> void:
	timer = $LevelCompleteDelay/OtherTimer
	# $LevelTransition.play("clean")
	timer.connect("timeout", after_wipe)
	timer.start(8.0 / 20.0)


func after_wipe():
	level_index += 1
	if level_index == 8:
		level_index = 0
		completed = true
	load_level(level_index)
	# $LevelTransition.play("default")
	
func on_level_restart():
	if level_index != 7:
		load_level(level_index)

func on_level_exit():
	level_index = 0
	
	load_level(level_index)
	$UI.visible = false

func on_level_select(index: int):
	level_index = index
	load_level(level_index)

func level_select():
	load_level_from_packed_scene(LevelSelect)
