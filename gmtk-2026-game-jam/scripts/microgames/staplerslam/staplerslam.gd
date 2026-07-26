extends Node2D

@export var TimerScene: PackedScene
@onready var stapler: AnimatedSprite2D = $stapler
@onready var staplerarea: Area2D = $stapler/staplerarea
@onready var results: Label = $Label
@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var effects: AudioStreamPlayer2D = $effects

@export var stapler_offset: Vector2 = Vector2(0,90)
@export var StapleScene: PackedScene

var overlapping_area: Array[Area2D] = []
var pending_staple = false
var last_area: Node2D
var staple_counter = 0
var timer_bar_instance
var end = false

signal game_end(outcome: String)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	timer_bar_instance = TimerScene.instantiate()
	canvas_layer.add_child(timer_bar_instance)
	timer_bar_instance.connect("time_up", Callable(self, "_on_timer_up"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if !end:
		var mouse_pos = get_global_mouse_position()
		stapler.global_position = mouse_pos - stapler_offset
		if staple_counter == 3:
			results.visible = true
			end = true
			timer_bar_instance.stop_timers()
			game_has_ended("win")

func _physics_process(_delta: float) -> void:
	if not pending_staple:
		return
	
	pending_staple = false
	
	if not _is_overlapping_now():
		return
	
	if last_area.is_stapled == true:
		return

	last_area.is_stapled = true

	_spawn_staple()

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed() and !end:
			pending_staple = true
				

func _spawn_staple():
	if StapleScene == null:
		return
	
	var mouse_pos = get_global_mouse_position()
	var staple = StapleScene.instantiate()
	effects.play()
	last_area.add_child(staple)
	staple.global_position = mouse_pos
	staple_counter += 1

func _is_overlapping_now() -> bool:
	for area in staplerarea.get_overlapping_areas():
		last_area = area.get_parent()
		return true
	return false

func _on_timer_up():
	results.text = "You're Loser!"
	results.visible = true
	end = true
	game_has_ended("lose")

func game_has_ended(result: String):
	await get_tree().create_timer(0.5).timeout
	emit_signal("game_end", result)
