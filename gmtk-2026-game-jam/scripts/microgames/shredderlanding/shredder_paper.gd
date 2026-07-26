extends CharacterBody2D

@export var paper_success = false
@onready var paper_sound: AudioStreamPlayer2D = $paper_sound

const FALL_SPEED = 120.0
const SPEED = 400.0
const initial_speed = 200.0

var speed_applied = false
var crashed = false

signal paper_crashed

func _physics_process(_delta: float) -> void:
	if !speed_applied:
		velocity.x = initial_speed
		speed_applied = true
		paper_sound.play()

	if not is_on_floor():
		velocity.y = FALL_SPEED
		
	var direction := Input.get_axis("ui_left", "ui_right")
	if !paper_success:
		if direction:
			if velocity.y > 0:
				velocity.x = direction * SPEED
				paper_sound.play()
	
	if velocity.y == 0:
		velocity.x = 0
		
	if velocity.y == 0 and crashed == false:
		crashed = true
		emit_signal("paper_crashed")
	
	
	move_and_slide()
