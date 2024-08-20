class_name Scaleable

extends Node2D

@export var SIZE: Vector2 = Vector2.ONE

@export var AREA_NODE: Area2D
@export var SCALEABLE_SPRITE: ScaleableSprite

func _init() -> void:
	var reciever = CardReciever.new()
	
	var shape = CollisionShape2D.new()
	var resource = RectangleShape2D.new()
	resource.size = Vector2(128, 128)
	shape.shape = resource
	reciever.add_child(shape)
	reciever.collision_layer = 128
	reciever.collision_mask = 64
	
	if AREA_NODE != null:
		AREA_NODE.scale = SIZE
		reciever.OTHER_NODE = AREA_NODE
	
	add_child(reciever)

func _physics_process(delta: float) -> void:
	SIZE = AREA_NODE.scale 