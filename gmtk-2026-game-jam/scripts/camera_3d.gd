extends Camera3D
# Changed the tween to alter global position instead of just position and it worked - Zach

@export var camera_move_speed: float = 0.75
@export var time_to_stare: float = 1.0
@export var shakeStrength: float = 0.01
@export var target_pos: Vector3 = Vector3(0, 0, 0)

var position_start: Vector3

func _ready():
	# print("Is current? ", current)
	position_start = position
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
