extends Node2D
 
signal hovered
signal hovered_off

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
		#$Area2D.collision_mask = 8
		#$Area2D.collision_layer = 8
		$Area2D/CollisionShape2D.disabled = true
		var random_frame
		while true:
			random_frame = Globals.rng.randi_range(94, 117)
			if !Globals.available_frames.has(random_frame):
				Globals.available_frames.append(random_frame)
				break
		
		$Sprite.frame = random_frame
		z_index = -5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func update_frame():
	$Sprite.frame = frame_value


func _on_area_2d_mouse_entered() -> void:
	emit_signal("hovered", self)


func _on_area_2d_mouse_exited() -> void:
	emit_signal("hovered_off", self)
