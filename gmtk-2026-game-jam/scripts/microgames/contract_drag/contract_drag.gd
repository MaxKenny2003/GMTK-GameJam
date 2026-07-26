extends Node2D

@export var TimerScene: PackedScene

@onready var paper: TextureRect = $paper
@onready var paper_area: Area2D = $paper/paper_area
@onready var signature: RichTextLabel = $paper/bottom_stuff/signature
@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var effects: AudioStreamPlayer2D = $effects

var scribble = preload("res://assets/Audio/scribble.mp3")
var timer_bar_instance

var game_over = false
var signature_visible = false
var dragging = false
var drag_offset = Vector2.ZERO
var type_speed = 20.0
var loop_end = false

signal game_end(outcome: String)

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	timer_bar_instance = TimerScene.instantiate()
	canvas_layer.add_child(timer_bar_instance)
	timer_bar_instance.connect("time_up", Callable(self, "_on_timer_up"))


func _process(delta: float) -> void:
	if signature_visible == true and signature.visible_ratio < 1.0:
		var ratio = type_speed / signature.get_total_character_count()
		signature.visible_ratio += ratio * delta
	
	if signature.visible_ratio >= 1.0 and !loop_end:
		loop_end = true
		game_has_ended("win")

func _input(event: InputEvent):
	if !game_over:
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				dragging = true
				drag_offset = paper.global_position - event.position
				effects.play()
			elif not event.pressed:
				dragging = false
		elif event is InputEventMouseMotion and dragging:
			var new_pos = event.position + drag_offset
			var screen_size = get_viewport_rect().size
			var width = paper.texture.get_size().x * paper.scale.x
			new_pos.x = clamp(new_pos.x, 0, screen_size.x - width)
			paper.global_position = new_pos

func _on_paper_area_area_exited(_area: Area2D) -> void:
	game_over = true
	timer_bar_instance.stop_timers()
	signature_visible = true
	effects.stream = scribble
	effects.play()

func _on_timer_up():
	game_over = true
	game_has_ended("lose")

func game_has_ended(result: String):
	await get_tree().create_timer(0.5).timeout
	emit_signal("game_end", result)
