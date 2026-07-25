extends Node2D

@onready var lose_text: Label = $Label
@onready var paper_stack: Node2D = $paper_stack
@onready var sprite: AnimatedSprite2D = $paper_stack/sprite
@onready var noise = FastNoiseLite.new()
@onready var paper_particle: CPUParticles2D = $paper_stack/paper_particle

var game_end = false

var canvas_width = 1152
var tilt = 0.0
var target_tilt = 0.0
var time = 0.0
var tilt_speed = 600.0
var max_tilt = 140.0
var tilt_thresh1 = max_tilt * (1.0 / 4.0)
var tilt_thresh2 = max_tilt * (2.0 / 4.0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	target_tilt = randf_range(-150, 150)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !game_end:
		if randf() < 0.05:
			target_tilt = randf_range(-200, 200)
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
	elif -tilt_thresh2 > tilt:
		sprite.frame = 4
	elif tilt_thresh1 < tilt and tilt < tilt_thresh2:
		sprite.frame = 1
	elif tilt_thresh2 < tilt:
		sprite.frame = 0
	else:
		sprite.frame = 2

func game_over():
	game_end = true
	sprite.visible = false
	paper_particle.restart()
	lose_text.visible = true
