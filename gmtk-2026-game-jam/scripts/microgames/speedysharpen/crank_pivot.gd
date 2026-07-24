extends Node2D

@export var rotation_sens = 1.0
@export var grab_radius = 5.0
@export var score_decay = 0.0

var grabbing = false
var pivot_global = Vector2.ZERO
var prev_angle = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		pass

func try_start_grab(mouse_pos: Vector2) -> void:
	pass
