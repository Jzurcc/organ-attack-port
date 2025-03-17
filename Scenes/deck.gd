extends Node2D

const CARD_SCENE_PATH = "res://Scenes/Card.tscn"
const HAND_COUNT = 1

var attack_deck = ["Necrosis", "Immunity Boost", "Cancer!", "a", "a", "a", "a"]

func _ready():
	#print($Area2D.collision_mask)
	pass


func draw_card():
	print("draw")
	if $"../PlayerHand".player_hand.size() < 5:
		var card_drawn = attack_deck[0]
		attack_deck.erase(card_drawn)
		if attack_deck.size() == 0:
			$Area2D/CollisionShape2D.disabled = true
			$Sprite.visible = false
		
		var card_scene = preload(CARD_SCENE_PATH)
		var new_card = card_scene.instantiate()
		$"../CardManager".add_child(new_card)
		new_card.name = "Card"
		$"../PlayerHand".add_card_to_hand(new_card)
