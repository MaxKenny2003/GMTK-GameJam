extends Node2D

@export var TimerScene: PackedScene
@onready var results: Label = $Label
@onready var win_area: Area2D = $shredder_front/Area2D
@onready var paper: CharacterBody2D = $paper
@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var effects: AudioStreamPlayer2D = $effects
var timer_bar_instance

var paper_crash = preload("res://assets/Audio/crumple.mp3")
signal game_end(outcome: String)

var running = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	timer_bar_instance = TimerScene.instantiate()
	canvas_layer.add_child(timer_bar_instance)
	timer_bar_instance.connect("time_up", Callable(self, "_on_timer_up"))
	paper.connect("paper_crashed", _on_paper_crash)


func _on_area_2d_body_entered(_body: Node2D) -> void:
	results.visible = true
	effects.play()
	timer_bar_instance.stop_timers()
	paper.paper_success = true
	game_has_ended("win")

func _on_timer_up():
	results.text = "You're Loser!"
	results.visible = true
	game_has_ended("lose")

func game_has_ended(result: String):
	await get_tree().create_timer(0.5).timeout
	emit_signal("game_end", result)

func _on_paper_crash():
	effects.stream = paper_crash
	effects.play()
