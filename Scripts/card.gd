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
		frame_value = Globals.rng.randi_range(0, 93)
		#position = $"../../AttackDeck".position
		update_frame()
		#scale = Vector2(1.35, 1.35)
	else:
		$Area2D/CollisionShape2D.disabled = true
		z_index = -1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func update_frame():
	$Sprite.frame = frame_value


func _on_area_2d_mouse_entered() -> void:
	emit_signal("hovered", self)


func _on_area_2d_mouse_exited() -> void:
	emit_signal("hovered_off", self)
