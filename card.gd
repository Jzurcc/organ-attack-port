extends Node2D

var frame_value = 0
@onready var sprite: AnimatedSprite2D = $Sprite
@export var frame: int = 0 :
	set(value):
		frame_value = value
		update_frame()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func update_frame():
	$Sprite.frame = frame_value
