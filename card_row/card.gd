class_name Card

extends Area2D

@export var type: int = 0
@export var default_position: Vector2 = Vector2.ZERO
var hovering = false
var dragging = false
var colliding_area: Area2D = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.frame = type

func _mouse_enter() -> void:
	hovering = true

func _mouse_exit() -> void:
	hovering = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if $"..".DRAGGING_CARD == null and hovering and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		dragging = true
		$"..".DRAGGING_CARD = self

	if dragging:
		global_position = get_global_mouse_position()
		scale = Vector2.ONE
		
	else:
		scale = Vector2.ONE / 2
		position += (default_position - position) * 0.2
	
	if !Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and dragging:
		dragging = false
		$"..".DRAGGING_CARD = null
		if colliding_area != null:
			match type:
				0: colliding_area.scale_up()
				1: colliding_area.scale_down()
				2: colliding_area.scale_up_x()
				3: colliding_area.scale_down_x()
				4: colliding_area.scale_up_y()
				5: colliding_area.scale_down_y()
			get_parent().CARDS.erase(self)
			get_parent().update_cards()
			get_parent().remove_child(self)
			
		
	

func _on_area_entered(area: Area2D) -> void:
	colliding_area = area

func _on_area_exited(area: Area2D) -> void:
	if area == colliding_area:
		colliding_area = null
