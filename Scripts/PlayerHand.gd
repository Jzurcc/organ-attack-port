extends Node2D




const CARD_WIDTH = 210	
var y_pos = 920
var y_offset = 0
var hidden_offset = 270

var player_hand = []
var center_screen_x
var hand_visible = true
var player_organs

func _ready() -> void:
	center_screen_x = get_viewport().size.x / 2
	player_organs = $"../PlayerOrgans1"
	


func add_card_to_hand(card):
	if card not in player_hand:
		player_hand.insert(0, card)
		update_hand_positions()
	else:
		animate_card_to_position(card, card.hand_pos)


func update_hand_positions():
	for i in range(player_hand.size()):
		var new_pos = Vector2(calculate_card_position(i), y_pos + y_offset)
		var card = player_hand[i]
		card.hand_pos = new_pos
		animate_card_to_position(card, new_pos)


func animate_card_to_position(card, new_pos):
	var tween = get_tree().create_tween()
	tween.tween_property(card, "position", new_pos, 0.1)


func calculate_card_position(index):
	var total_width = (player_hand.size() - 1) * CARD_WIDTH
	var x_offset = center_screen_x + index * CARD_WIDTH - total_width / 2
	return x_offset


func remove_card_from_hand(card):
	if card in player_hand:
		player_hand.erase(card)
		update_hand_positions()


func toggle_hand_view():
	hand_visible = !hand_visible
	if y_offset == 0:
		y_offset = hidden_offset
	else:
		y_offset = 0
	update_hand_positions()


func disable_organ_hover():
	pass
