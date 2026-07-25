extends Node2D

@export var TimerScene: PackedScene

@onready var paper: TextureRect = $paper
@onready var paper_area: Area2D = $paper/paper_area
@onready var results: Label = $Label
@onready var signature: RichTextLabel = $paper/bottom_stuff/signature
@onready var canvas_layer: CanvasLayer = $CanvasLayer

var timer_bar_instance

var game_over = false
var signature_visible = false
var dragging = false
var drag_offset = Vector2.ZERO
var type_speed = 20.0

signal game_end(outcome: String)

func _ready() -> void:
	timer_bar_instance = TimerScene.instantiate()
	canvas_layer.add_child(timer_bar_instance)
	timer_bar_instance.connect("time_up", Callable(self, "_on_timer_up"))


func _process(delta: float) -> void:
	if signature_visible == true and signature.visible_ratio < 1.0:
		var ratio = type_speed / signature.get_total_character_count()
		signature.visible_ratio += ratio * delta
	
	if signature.visible_ratio >= 1.0:
		results.visible = true
		game_has_ended("win")

func _input(event: InputEvent):
	if !game_over:
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				dragging = true
				drag_offset = paper.global_position - event.position
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

func _on_timer_up():
	game_over = true
	results.text = "You're Loser!"
	results.visible = true
	game_has_ended("lose")

func game_has_ended(result: String):
	emit_signal("game_end")
