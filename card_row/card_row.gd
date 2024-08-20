extends Node2D

@export var CARDS: Array[Card] = []
@export var CARD_COUNT: int
@export var DRAGGING_CARD: Card = null
@export var CARD_INSTANCE: PackedScene
var target_position: Vector2
var init_position: Vector2

# Called when the node enters the scene tree for the first time.
func setup(cards: Array[int]) -> void:
	var xOffset = 120

	DRAGGING_CARD = null
	for card in CARDS:
		card.queue_free()	
	CARDS.clear()

	for type in cards:
		var card = CARD_INSTANCE.instantiate(PackedScene.GEN_EDIT_STATE_DISABLED)
		card.type = type
		card.position = Vector2(xOffset, 0)
		xOffset += 80
		add_child(card)
		card.default_position = card.position
		CARDS.append(card)
	$Bar/Mask.position = Vector2(0, 100)

func update_cards():
	var xOffset = 120
	
	for card in CARDS:
		card.default_position = Vector2(xOffset, 0)
		xOffset += 80

func _process(delta: float) -> void:
	target_position = Vector2((CARDS.size() * 10.0 ) + (int (CARDS.size() > 0.0) * 14 ), 0.0)
	$Bar/Mask.position += (target_position - $Bar/Mask.position) * 0.2


func _on_level_manager_loaded_level(index:int) -> void:
	CARDS.clear()
	$Bar/Mask.position = Vector2(0, 100)
