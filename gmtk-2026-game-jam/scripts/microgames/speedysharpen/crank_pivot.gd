extends Node2D

@onready var handle_hotspot: Node2D = $handle/handle_hotspot
@onready var win_text: Label = $"../Label"

@export var rotation_sens = 1.0
@export var grab_radius = 150.0
@export var rotation_offset_deg = 0.0
@export var target_rotation_deg = 3600.0

@export var torque_str = 40.0
@export var max_ang_accel = 1200.0

@export var damping = 3.0
@export var stop_damping = 5.0

var grabbing = false
var won = false

var pivot_global = Vector2.ZERO
var progressed_rad = 0.0
var prev_angle_rad = 0.0
var allowed_sign = 1.0

var desired_angle = 0.0
var ang_vel = 0.0

var mouse_to_crank_offset_rad = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if grabbing:
		var mouse_global = get_global_mouse_position()
		var raw_mouse_ang = get_angle_to_mouse(mouse_global)
		desired_angle = deg_to_rad(rotation_offset_deg) + (raw_mouse_ang * rotation_sens)

func _physics_process(delta: float) -> void:
	if won:
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
		
	else:
		ang_vel -= ang_vel * stop_damping * delta
		rotation += ang_vel * delta
		
		if abs(ang_vel) < 0.001:
			ang_vel = 0.0
	
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
	
	if won:
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
	win_text.visible = true
	won = true
