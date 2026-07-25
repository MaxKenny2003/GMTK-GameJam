extends Control

@onready var timer: Timer = $GameTimer
@onready var label: Label = $TextureRect/Label
@onready var texture_rect: ColorRect = $TextureRect
@onready var game_loss: Label = $GameOverLabel


const MICROGAME_INTRO = preload("res://scenes/ui/microgame_intro.tscn")

#Need preloaded scenes for the microgames to pass into start_microgame() 


func _ready() -> void:
	timer.start()
	show_instructions()


func _process(delta: float) -> void:
	label.text = str(snapped(timer.time_left, 0.1))
	

func show_instructions():
	var instructions = MICROGAME_INTRO.instantiate()
	timer.paused = true
	add_child(instructions)
	instructions.change_inputs(2, 1, "Test")
	await get_tree().create_timer(3.5).timeout
	timer.paused = false
	start_microgame()


func start_microgame():
	pass


func _on_timer_timeout() -> void:
	get_tree().paused = true
	set_physics_process(false)
	game_loss.show()
	
