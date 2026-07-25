extends Node2D

@export var TimerScene: PackedScene
var timer_bar_instance

@onready var plug: AnimatedSprite2D = $plug
@onready var plug_area: Area2D = $plug/Area2D
@onready var results: Label = $Label
@onready var snap_point: Node2D = $outlet/snap_point
@onready var plug_center: Node2D = $plug/plug_center
@onready var canvas_layer: CanvasLayer = $CanvasLayer

var start_pos = Vector2(60, 705)
var end_pos = Vector2(1062, 705)
@export var travel_time = 2.5
var rise_time = 1.0

var cable_height = 520.0
var plug_height = 70.0

var h_tween: Tween
var v_tween: Tween
var max_allowed_y = 300.0

signal game_end

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	start_oscillation()
	timer_bar_instance = TimerScene.instantiate()
	canvas_layer.add_child(timer_bar_instance)
	timer_bar_instance.connect("time_up", Callable(self, "_on_timer_up"))
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if v_tween:
		for area in plug_area.get_overlapping_areas():
			v_tween.kill()
			v_tween = null
			timer_bar_instance.stop_timers()
			plug.frame = 1
			plug.position = Vector2(snap_point.global_position.x, snap_point.global_position.y + (cable_height / 2) - (plug_height / 2))
			results.visible = true
			game_has_ended()

func start_oscillation() -> void:
	while true:
		h_tween = create_tween()
		h_tween.tween_property(plug, "global_position", end_pos, travel_time)\
			.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
		await h_tween.finished
		
		await get_tree().create_timer(0.05).timeout
		
		h_tween = create_tween()
		h_tween.tween_property(plug, "global_position", start_pos, travel_time)\
			.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
		await h_tween.finished
		
		await get_tree().create_timer(0.05).timeout

func _input(event: InputEvent):
	if event.is_action_pressed("ui_accept"):
		on_space_pressed()
	
func on_space_pressed() -> void:
	if h_tween:
			h_tween.kill()
			h_tween = null
	
	var current_x = plug.position.x
	var target_y = plug.position.y - max_allowed_y
	var target = Vector2(current_x, target_y)
	v_tween = create_tween()
	v_tween.tween_property(plug, "global_position", target, rise_time)
	await v_tween.finished
	plug_missed()
	
func _on_timer_up():
	results.text = "You're Loser!"
	if h_tween:
		h_tween.kill()
	if v_tween:
		v_tween.kill()
	results.visible = true
	game_has_ended()

func plug_missed():
	plug.frame = 2
	results.text = "You're Loser!"
	results.visible = true
	game_has_ended()

func game_has_ended():
	emit_signal("game_end")
