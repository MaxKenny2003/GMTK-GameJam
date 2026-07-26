extends Camera3D
# Changed the tween to alter global position instead of just position and it worked - Zach

@export var camera_move_speed: float = 0.75
@export var time_to_stare: float = 1.0
@export var shakeStrength: float = 0.01
@export var target_pos: Vector3 = Vector3(0, 0, 0)
@export var bpm = 100.0
@export var pulse_strength = 0.25
@onready var game: Node = $"../GameManager"
var spectrum = AudioEffectSpectrumAnalyzerInstance

var time_passed = 0.0

var position_start: Vector3

func _ready():
	# print("Is current? ", current)
	position_start = position
	spectrum = AudioServer.get_bus_effect_instance(0, 0) as AudioEffectSpectrumAnalyzerInstance
	print("Started move from ", position, " to ", target_pos)
	move_camera()

func move_camera():
	var tween = create_tween()
	tween.tween_property(self, "global_position", target_pos, 2.0)
	await tween.finished
	FlowController.set_looking_at_computer(true)
	FlowController.set_can_start_game(true)
	FlowController.set_can_move_camera(true)
	FlowController.set_move_camera(true)

func _process(_delta: float):
	if game.should_be_pulsing:
		#if spectrum:
			#var energy = spectrum.get_magnitude_for_frequency_range(40, 120).length()
			#apply_camera_pulse(energy)
		time_passed += _delta
		var beat_freq = bpm / 60.0
		var pulse = sin(time_passed * beat_freq * TAU) * pulse_strength
		fov = 70.0 + pulse * 10.0
	if FlowController.move_Camera and FlowController.can_move and not FlowController.is_in_game and not FlowController.gameOver:
		FlowController.set_can_start_game(false)
		rotate_camera()
		FlowController.set_move_camera(false)

	if FlowController.is_camera_shaking:
		var offset = Vector3(
			(randf() * 2 - 1) * shakeStrength,
			(randf() * 2 - 1) * shakeStrength,
			(randf() * 2 - 1) * shakeStrength
		)
		position = target_pos + offset

func rotate_camera():
	FlowController.set_send_toast(true)
	var tween = create_tween()
	FlowController.set_move_camera(false)
	FlowController.set_can_move_camera(false)
	tween.tween_property(self, "rotation", Vector3(0, deg_to_rad(0), 0), camera_move_speed)\
		.set_trans(Tween.TRANS_SINE)\
		.set_ease(Tween.EASE_IN_OUT)
	await tween.finished
	await get_tree().create_timer(time_to_stare).timeout

	var tween2 = create_tween()
	tween2.tween_property(self, "rotation", Vector3(0, deg_to_rad(90), 0), camera_move_speed)\
		.set_trans(Tween.TRANS_SINE)\
		.set_ease(Tween.EASE_IN_OUT)
	await tween2.finished
	FlowController.set_looking_at_computer(true)
	FlowController.set_can_move_camera(true)
	FlowController.set_can_start_game(true)
	
#func apply_camera_pulse(energy: float):
	#var shake_strength = clamp(energy / 2.0, 0.0, 1.0)
	#var offset = Vector3(randf_range(-shake_strength, shake_strength), randf_range(-shake_strength, shake_strength), 0)
	#global_position = position_start + offset
