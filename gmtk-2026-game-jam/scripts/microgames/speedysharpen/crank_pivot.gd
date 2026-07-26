extends Node2D

@export var TimerScene: PackedScene
@onready var handle_hotspot: Node2D = $handle/handle_hotspot
@onready var canvas_layer: CanvasLayer = $"../CanvasLayer"
@onready var effects: AudioStreamPlayer2D = $"../effects"
@onready var pencil_particle: CPUParticles2D = $"../pencil_particle"

@export var rotation_sens = 1.0
@export var grab_radius = 150.0
@export var rotation_offset_deg = 0.0
@export var target_rotation_deg = 1800.0

@export var torque_str = 25.0
@export var max_ang_accel = 1200.0

@export var damping = 3.0
@export var stop_damping = 5.0

var grabbing = false
var playing = false
var end = false

var pivot_global = Vector2.ZERO
var progressed_rad = 0.0
var prev_angle_rad = 0.0
var allowed_sign = 1.0

var desired_angle = 0.0
var ang_vel = 0.0

var mouse_to_crank_offset_rad = 0.0
var timer_bar_instance

signal game_end1(outcome: String)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	timer_bar_instance = TimerScene.instantiate()
	canvas_layer.add_child(timer_bar_instance)
	timer_bar_instance.connect("time_up", Callable(self, "_on_timer_up"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if grabbing:
		var mouse_global = get_global_mouse_position()
		var raw_mouse_ang = get_angle_to_mouse(mouse_global)
		desired_angle = deg_to_rad(rotation_offset_deg) + (raw_mouse_ang * rotation_sens)
	

func _physics_process(delta: float) -> void:
	if end:
		return
		
	if grabbing:
		var error = wrapf(desired_angle - rotation, -PI, PI)
		var accel = clamp(error * torque_str, -max_ang_accel, max_ang_accel)
		
		if accel * allowed_sign < 0.0:
			accel = 0.0
		
		ang_vel += accel * delta
		
		if ang_vel * allowed_sign < 0.0:
			ang_vel = 0.0
		
		ang_vel -= ang_vel * damping * delta
		rotation += ang_vel * delta
		if !playing:
			playing = true
			effects.play()
			pencil_particle.emitting = true
		effects.pitch_scale = lerp(0.85, 1.15, clamp(ang_vel / 10.0, 0.0, 1.0))
	else:
		ang_vel -= ang_vel * stop_damping * delta
		rotation += ang_vel * delta
		
		if abs(ang_vel) < 0.001:
			ang_vel = 0.0
		
		if abs(ang_vel) < 2:
			playing = false
			pencil_particle.emitting = false
			effects.stop()
	
	var step = abs(wrapf(rotation - prev_angle_rad, -PI, PI))
	progressed_rad += step
	prev_angle_rad = rotation
	
	
	if progressed_rad >= deg_to_rad(target_rotation_deg):
		_win()

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			try_start_grab(event.position)
		else:
			if grabbing:
				stop_grab()

func try_start_grab(_mouse_pos: Vector2) -> void:
	var mouse_global = get_global_mouse_position()
	pivot_global = global_position
	
	if mouse_global.distance_to(pivot_global) > grab_radius:
		return
	
	if end:
		return
	
	grabbing = true
	
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	var raw_mouse_angle = get_angle_to_mouse(mouse_global)
	var desired_without_offset = deg_to_rad(rotation_offset_deg) + (raw_mouse_angle * rotation_sens)
	
	mouse_to_crank_offset_rad = rotation - desired_without_offset
	desired_angle = desired_without_offset
	progressed_rad = 0.0
	prev_angle_rad = rotation
	ang_vel = 0.0

func get_angle_to_mouse(mouse_global: Vector2) -> float:
	var v = mouse_global - pivot_global
	return atan2(v.y, v.x)

func stop_grab() -> void:
	var warp_zone = handle_hotspot.global_position
	grabbing = false
	DisplayServer.warp_mouse(warp_zone)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _win() -> void:
	stop_grab()
	effects.stop()
	pencil_particle.emitting = false
	timer_bar_instance.stop_timers()
	end = true
	game_has_ended("win")

func _on_timer_up():
	effects.stop()
	pencil_particle.emitting = false
	end = true
	game_has_ended("lose")

func game_has_ended(result: String):
	await get_tree().create_timer(0.5).timeout
	emit_signal("game_end1", result)
