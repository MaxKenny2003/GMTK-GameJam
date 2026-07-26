extends Node2D

@onready var text: RichTextLabel = $text_margin/textbody
@onready var canvas_layer: CanvasLayer = $CanvasLayer
@export var TimerScene: PackedScene
@onready var effects: AudioStreamPlayer2D = $effects

var timer_bar_instance
var end = false

signal game_end(outcome: String)

var max_visibility = 1.0
@export var typing_boost = 5.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	text.visible_ratio = 0
	timer_bar_instance = TimerScene.instantiate()
	canvas_layer.add_child(timer_bar_instance)
	timer_bar_instance.connect("time_up", Callable(self, "_on_timer_up"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if text.visible_ratio >= 1.0 and !end:
		end = true
		timer_bar_instance.stop_timers()
		game_has_ended("win")

func _input(event: InputEvent):
	var chartotal = text.get_total_character_count()
	if event is InputEventKey:
		if event.is_pressed() and text.visible_ratio < 1.0:
			var pitch_rand = randf_range(0.85, 1.15)
			effects.pitch_scale = pitch_rand
			effects.play()
			text.visible_ratio += (max_visibility / chartotal) * typing_boost

func _on_timer_up():
	game_has_ended("lose")

func game_has_ended(result: String):
	await get_tree().create_timer(0.5).timeout
	emit_signal("game_end", result)
