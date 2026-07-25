extends CharacterBody2D

@export var paper_success = false

const FALL_SPEED = 150.0
const SPEED = 400.0
const initial_speed = 400.0

var speed_applied = false

func _physics_process(_delta: float) -> void:
	if !speed_applied:
		velocity.x = initial_speed
		speed_applied = true

	if not is_on_floor():
		velocity.y = FALL_SPEED
		
	var direction := Input.get_axis("ui_left", "ui_right")
	if !paper_success:
		if direction:
			if velocity.y > 0:
				velocity.x = direction * SPEED
	
	if velocity.y == 0:
		velocity.x = 0
	
	move_and_slide()
