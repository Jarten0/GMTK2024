extends Node2D

@export var CARDS: Array[Card] = []
@export var CARD_COUNT: int
@export var DRAGGING_CARD: Card = null
@export var CARD_INSTANCE: PackedScene

# Called when the node enters the scene tree for the first time.
func setup(cards: Array[int]) -> void:
	var xOffset = 0
	for card in CARDS:
		remove_child(card)
	
	CARDS.clear()
	
	for type in cards:
		var card = CARD_INSTANCE.instantiate(PackedScene.GEN_EDIT_STATE_DISABLED)
		card.type = type
		card.position = Vector2(xOffset, 0)
		xOffset += 160
		add_child(card)
		card.default_position = card.position
		CARDS.append(card)
