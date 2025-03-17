extends Node2D


const COLLISION_MASK_CARD = 1
const COLLISION_MASK_CARD_SLOT = 2

var card_being_dragged
var pivot_offset = Vector2.ZERO
var screen_size
var is_hovering_on_card
var player_hand
var scaled = Vector2(1.05, 1.05)
var unscaled = Vector2(1, 1)
var input_manager


func _ready() -> void:
	screen_size = get_viewport_rect().size
	player_hand = $"../PlayerHand"
	input_manager = $"../InputManager"
	input_manager.connect("left_mouse_button_released", on_left_click_released)


func _process(delta: float) -> void:
	if card_being_dragged:
		var mouse_pos = get_global_mouse_position()
		var new_position = mouse_pos - pivot_offset
		card_being_dragged.position = Vector2(clamp(new_position.x, 0, screen_size.x), clamp(new_position.y, 0, screen_size.y))


func start_drag(card):
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	card_being_dragged = card
	card.scale = unscaled
	pivot_offset = get_global_mouse_position() - card_being_dragged.position
	card_being_dragged.get_parent().move_child(card_being_dragged, -1)


func finish_drag():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	card_being_dragged.scale = scaled
	var slot_found = raycast_check_for_card_slot()
	if slot_found and not slot_found.card_in_slot:
		card_being_dragged.rotation = slot_found.rotation
		card_being_dragged.position = slot_found.position
		card_being_dragged.get_node("Area2D/CollisionShape2D").disabled = true
		slot_found.card_in_slot = true
		player_hand.remove_card_from_hand(card_being_dragged)
	else:
		player_hand.add_card_to_hand(card_being_dragged)
	card_being_dragged = null


func raycast_check_for_card():
	var space_state = get_world_2d().direct_space_state
	var parameters = PhysicsPointQueryParameters2D.new()
	parameters.position = get_global_mouse_position() - pivot_offset
	parameters.collide_with_areas = true
	parameters.collision_mask = COLLISION_MASK_CARD
	var result = space_state.intersect_point(parameters)
	if result.size() > 0:
		return get_highest_z_card(result)
	return null


func raycast_check_for_card_slot():
	var space_state = get_world_2d().direct_space_state
	var parameters = PhysicsPointQueryParameters2D.new()
	parameters.position = get_global_mouse_position() - pivot_offset
	parameters.collide_with_areas = true
	parameters.collision_mask = COLLISION_MASK_CARD_SLOT
	var result = space_state.intersect_point(parameters)
	if result.size() > 0:
		return result[0].collider.get_parent()
	return null


func get_highest_z_card(cards):
	var highest_z_card = cards[0].collider.get_parent()
	var highest_z_index = highest_z_card.z_index
	
	for i in range(1, cards.size()):
		var current_card = cards[i].collider.get_parent()
		if current_card.z_index > highest_z_index:
			highest_z_card = current_card
			highest_z_index = current_card.z_index
	return highest_z_card

func connect_card_signals(card):
	card.connect("hovered", on_hovered_over_card)
	card.connect("hovered_off", on_hovered_off_card)


func on_hovered_over_card(card):
	if !is_hovering_on_card:
		highlight_card(card, true)
		is_hovering_on_card = true


func on_hovered_off_card(card):
	if !card_being_dragged:
		highlight_card(card, false)
		var new_card_hovered = raycast_check_for_card()
		if new_card_hovered:
			highlight_card(new_card_hovered, true)
		else:
			is_hovering_on_card = false


func highlight_card(card, hovered):
	if hovered:
		card.scale = scaled
		card.z_index = 2
	else:
		card.scale = unscaled
		card.z_index = 1
		

func on_left_click_released():
	if card_being_dragged:
		finish_drag()
