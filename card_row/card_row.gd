extends Node2D

@export var CARDS: Array[Card]
@export var CARD_COUNT: int

# Called when the node enters the scene tree for the first time.
func setup(cards: Array[Card]) -> void:
	CARDS = cards
	var xOffset = 0
	for card in cards:
		card.position = Vector2(xOffset, 0)
		xOffset += 64
		add_child(card)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
