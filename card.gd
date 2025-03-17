extends Node2D
 
signal hovered
signal hovered_off

var frame_value = 0
@onready var sprite: AnimatedSprite2D = $Sprite
@export var frame: int = 0 :
	set(value):
		frame_value = value
		update_frame()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_parent().connect_card_signals(self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func update_frame():
	$Sprite.frame = frame_value


func _on_area_2d_mouse_entered() -> void:
	emit_signal("hovered", self)


func _on_area_2d_mouse_exited() -> void:
	emit_signal("hovered_off", self)
