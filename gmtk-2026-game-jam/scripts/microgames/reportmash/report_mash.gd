extends Node2D

@onready var text: RichTextLabel = $MarginContainer/textbody
@onready var win_text: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text.visible_ratio = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if text.visible_ratio >= 1.0:
		win_text.visible = true

func _input(event: InputEvent):
	var chartotal = text.get_total_character_count()
	var max_visibility = 1.0
	var char_bonus = 3.0
	if event is InputEventKey:
		if event.is_pressed():
			text.visible_ratio += (max_visibility / chartotal) * char_bonus
