extends Node2D

@export var TimerScene: PackedScene
@export var PopupScene: PackedScene
@export var total_popups = 12
@onready var results: Label = $Label
@onready var canvas_layer: CanvasLayer = $CanvasLayer
var close_count = 0
var timer_bar_instance

signal game_end(outcome: String)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_popups(total_popups)
	timer_bar_instance = TimerScene.instantiate()
	canvas_layer.add_child(timer_bar_instance)
	timer_bar_instance.connect("time_up", Callable(self, "_on_timer_up"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func spawn_popups(count):
	for i in range(count):
		var popup = PopupScene.instantiate()
		randomize_position(popup)
		add_child(popup)
		
		popup.popup_closed.connect(_on_popup_closed)

func randomize_position(popup):
	var x = randf_range(0, 792)
	var y = randf_range(0, 364)
	popup.position = Vector2(x,y)

func _on_popup_closed() -> void:
	close_count += 1
	
	if close_count >= total_popups:
		results.visible = true
		timer_bar_instance.stop_timers()
		game_has_ended("win")
		

func _on_timer_up():
	results.text = "You're Loser!"
	results.visible = true
	game_has_ended("lose")

func game_has_ended(result: String):
	emit_signal("game_end", result)
