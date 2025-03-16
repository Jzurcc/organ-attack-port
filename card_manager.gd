extends Node2D

var card_being_dragged
var pivot_offset = Vector2.ZERO
var screen_size



func _process(delta: float) -> void:
	if card_being_dragged:
		screen_size = get_viewport_rect().size
		var mouse_pos = get_global_mouse_position()
		var new_position = mouse_pos - pivot_offset
		card_being_dragged.position = Vector2(clamp(new_position.x, 0, screen_size.x), clamp(new_position.y, 0, screen_size.y))


func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		pivot_offset = Vector2.ZERO
		if event.pressed:
			var card = raycast_check_for_card()
			if card:
				card_being_dragged = card
				pivot_offset = get_global_mouse_position() - card_being_dragged.position
				card_being_dragged.get_parent().move_child(card_being_dragged, -1)
		else:
			card_being_dragged = null


func raycast_check_for_card():
	var space_state = get_world_2d().direct_space_state
	var parameters = PhysicsPointQueryParameters2D.new()
	parameters.position = get_global_mouse_position() - pivot_offset
	parameters.collide_with_areas = true
	parameters.collision_mask = 1
	var result = space_state.intersect_point(parameters)
	if result.size() > 0:
		return result[0].collider.get_parent()
	return null
