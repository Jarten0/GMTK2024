class_name LevelManager

extends Node2D

@export var InitialScene: PackedScene
@export var LevelSelect: PackedScene
@export var PackedSceneLevels: Array[PackedScene]

var current_level: Node
var level_index: int = 0

signal loaded_level(index: int)

func load_level(index: int):
	level_index = index
	if current_level != null:
		remove_child(current_level)
	current_level = PackedSceneLevels[index].instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
	add_child(current_level)

	emit_signal("loaded_level", index)
	
	if current_level is LevelSignals:
		current_level.LevelComplete.connect(on_level_complete)
		current_level.LevelExit.connect(on_level_exit)
		current_level.LevelReset.connect(on_level_restart)
		%CardRow.setup(current_level.CARDS)
		

	if index != 0:
		$UI.visible = true


func load_level_from_packed_scene(scene: PackedScene):
	if current_level != null:
		remove_child(current_level)
	current_level = scene.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
	add_child(current_level)
	
	if current_level is LevelSignals:
		current_level.LevelComplete.connect(on_level_complete())
		current_level.LevelExit.connect(on_level_exit())
		current_level.LevelReset.connect(on_level_restart())

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_level_from_packed_scene(InitialScene)
	var array: Array[int] = [0,1,2,3,4,5]
	%CardRow.setup(array)
	$UI.visible = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Restart"):
		on_level_restart()
	if Input.is_action_just_pressed("Exit"):
		on_level_exit()

func on_level_complete():
	$LevelCompleteDelay.start()
	current_level.get_node("Global Tick").start(0.1)
	
func _on_level_complete_delay_timeout() -> void:
	level_index += 1
	load_level(level_index)
	
func on_level_restart():
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
