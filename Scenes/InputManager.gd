extends Node2D

signal left_mouse_button_clicked
signal left_mouse_button_released

const COLLISION_MASK_CARD = 1
const COLLISION_MASK_DECK = 4

var card_manager
var pivot_offset
var deck
var player_hand
var tab_pressed = false

func _ready() -> void:
	card_manager = $"../CardManager"
	deck = $"../AttackDeck"
	player_hand = $"../CardManager/PlayerHand1"


func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		pivot_offset = Vector2.ZERO
		if event.pressed:
			emit_signal("left_mouse_button_clicked")
			raycast_at_cursor()
		else:
			emit_signal("left_mouse_button_released")
	elif event is InputEventKey and event.keycode == KEY_ALT:
		if event.is_released():
			if !card_manager.hovered_card or card_manager.hovered_card.is_organ or event.is_released():
				card_manager.hide_enlarged_card(card_manager.hovered_card)
		elif event.pressed and card_manager.hovered_card:
			card_manager.show_enlarged_card(card_manager.hovered_card)
	elif event is InputEventKey and event.keycode == KEY_TAB:
		if event.pressed and !tab_pressed:
			tab_pressed = true
			player_hand.toggle_hand_view()
		elif event.is_released():
			tab_pressed = false


func raycast_at_cursor():
	var space_state = get_world_2d().direct_space_state
	var parameters = PhysicsPointQueryParameters2D.new()
	parameters.position = get_global_mouse_position() - pivot_offset
	parameters.collide_with_areas = true
	var result = space_state.intersect_point(parameters)
	if result.size() > 0:
		var result_collision_mask = result[0].collider.collision_mask
		if result_collision_mask == COLLISION_MASK_CARD:
			var card_found = result[0].collider.get_parent()
			if card_found:
				card_manager.start_drag(card_found)
		elif result_collision_mask == COLLISION_MASK_DECK:
			deck.draw_card()
