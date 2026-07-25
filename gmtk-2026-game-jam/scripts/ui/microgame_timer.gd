extends Control

@onready var time_bar: AnimatedSprite2D = $time_bar
@onready var animation_timer: Timer = $animation_timer
@onready var level_timer: Timer = $level_timer

@export var base_animation_time = 4.0 # seconds
@export var base_level_time = 8.0 # seconds

signal time_up

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_timer.wait_time = base_animation_time / time_bar.speed_scale
	level_timer.wait_time = base_level_time - base_animation_time
	level_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_level_timer_timeout() -> void:
	time_bar.visible = true
	time_bar.play("timer")
	animation_timer.start()

func _on_animation_timer_timeout() -> void:
	time_bar.stop()
	time_bar.frame = 8
	emit_signal("time_up")

func stop_timers():
	var last_frame = time_bar.frame
	level_timer.stop()
	animation_timer.stop()
	time_bar.stop()
	time_bar.frame = last_frame
