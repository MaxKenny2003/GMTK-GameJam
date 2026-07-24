extends CanvasLayer
@onready var timer: Timer = $Timer

@onready var title_label: Label = $Control/GameTitleBackground/TitleLabel
@onready var keyboard: TextureRect = $Control/HBoxContainer/Keyboard
@onready var mouse: TextureRect = $Control/HBoxContainer/Mouse
@onready var keyboards: Array[Texture2D] = [
	preload("res://assets/2D/KeyboardTemplate.png"),
	preload("res://assets/2D/KeyboardSpace.png"),
	preload("res://assets/2D/KeyboardArrows.png"),
	preload("res://assets/2D/KeyboardAll.png")
]
@onready var mouses: Array[Texture2D] = [
	preload("res://assets/2D/MouseTemplate.png"),
	preload("res://assets/2D/MouseLeft.png"),
	preload("res://assets/2D/MouseMoveLeft.png")
]

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

func change_inputs(keyboard_index, mouse_index, game_title):
	if (visible == false):
		visible = true;
		timer.start();
	keyboard.texture = keyboards[keyboard_index];
	mouse.texture = mouses[mouse_index];
	title_label.text = game_title;


func _on_timer_timeout() -> void:
	visible = false;
