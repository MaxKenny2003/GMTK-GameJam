extends Node2D

@export var TimerScene: PackedScene

@onready var paper_stack: Node2D = $paper_stack
@onready var sprite: AnimatedSprite2D = $paper_stack/sprite
@onready var noise = FastNoiseLite.new()
@onready var paper_particle: CPUParticles2D = $paper_stack/paper_particle
@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var effects: AudioStreamPlayer2D = $effects

var game_is_over = false
var timer_bar_instance
var flutter = preload("res://assets/Audio/paper_flutter.mp3")
var crumple = preload("res://assets/Audio/crumple.mp3")
var slip = preload("res://assets/Audio/paper_slide.mp3")

var last_frame = 2

var canvas_width = 1152
var tilt = 0.0
var target_tilt = 0.0
var time = 0.0
var tilt_speed = 600.0
var max_tilt = 140.0
var tilt_thresh1 = max_tilt * (1.0 / 4.0)
var tilt_thresh2 = max_tilt * (2.0 / 4.0)

signal game_end(outcome: String)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	target_tilt = randf_range(-200, 200)
	timer_bar_instance = TimerScene.instantiate()
	canvas_layer.add_child(timer_bar_instance)
	timer_bar_instance.connect("time_up", Callable(self, "_on_timer_up"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !game_is_over:
		if randf() < 0.05:
			var left_or_right = randi_range(1,2)
			if left_or_right == 1:
				target_tilt = randf_range(-250, -100)
			else: if left_or_right == 2:
				target_tilt = randf_range(100, 250)
		tilt = move_toward(tilt, target_tilt, 200 * delta)
		if Input.is_action_pressed("ui_left"):
			tilt -= tilt_speed * delta
		if Input.is_action_pressed("ui_right"):
			tilt += tilt_speed * delta
		paper_stack.position.x = canvas_width / 2.0 + (tilt * 0.4)
		
		if abs(tilt) > max_tilt:
			game_over()
	
	update_stack_frame()

func update_stack_frame():
	if -tilt_thresh1 > tilt and tilt > -tilt_thresh2:
		sprite.frame = 3
		if last_frame != 3:
			effects.stream = slip
			effects.play()
		last_frame = 3
	elif -tilt_thresh2 > tilt:
		sprite.frame = 4
		if last_frame != 4:
			effects.stream = crumple
			effects.play()
		last_frame = 4
	elif tilt_thresh1 < tilt and tilt < tilt_thresh2:
		sprite.frame = 1
		if last_frame != 1:
			effects.stream = slip
			effects.play()
		last_frame = 1
	elif tilt_thresh2 < tilt:
		sprite.frame = 0
		if last_frame != 0:
			effects.stream = crumple
			effects.play()
		last_frame = 0
	else:
		sprite.frame = 2

func game_over():
	game_is_over = true
	timer_bar_instance.stop_timers()
	sprite.visible = false
	paper_particle.restart()
	effects.stream = flutter
	effects.play()
	game_has_ended("lose")

func _on_timer_up():
	game_is_over = true
	game_has_ended("win")

func game_has_ended(result: String):
	await get_tree().create_timer(0.5).timeout
	emit_signal("game_end", result)
