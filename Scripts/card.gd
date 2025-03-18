extends Node2D
 
signal hovered
signal hovered_off


const four_player_scale = 0.75
const six_player_scale = 0.5


var frame_value = 0
var hand_pos

@onready var sprite: AnimatedSprite2D = $Sprite
@export var is_organ: bool = false
@export var frame: int = 0 :
	set(value):
		frame_value = value
		update_frame()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	if !is_organ:
		get_parent().connect_card_signals(self)
		#frame_value = Globals.rng.randi_range(0, 93)
		position = $"../../AttackDeck".position
		update_frame()
		#scale = Vector2(1.35, 1.35)
	else:
		get_parent().get_parent().connect_card_signals(self)
		#$Area2D.collision_mask = 8
		#$Area2D.collision_layer = 8
		$Area2D.collision_mask = 8
		var key
		var value
		while true:
			var rand_int = Globals.rng.randi_range(0, 23)
			key = Globals.ORGANS.keys()[rand_int] # rng.randi_range(94, 117)
			value = (Globals.ORGANS[key])[0]
			if !Globals.available_frames.has(value):
				name = key
				Globals.available_frames.append(value)
				break
		
		$Sprite.frame = value
		#z_index = -5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func update_frame():
	$Sprite.frame = frame_value


func _on_area_2d_mouse_entered() -> void:
	emit_signal("hovered", self)


func _on_area_2d_mouse_exited() -> void:
	emit_signal("hovered_off", self)
