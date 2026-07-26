extends Node3D

@export var asteroid_state_positions: Array[Vector3] = []
@export var colorRect: ColorRect
@export var total_game_time: float = 270.0

var asteroid_state: int = 0
var is_moving: bool = false
var world_environment: WorldEnvironment
var reset: Environment

func _ready():
	world_environment = get_node("../WorldEnvironment") as WorldEnvironment
	# Deep-duplicate so we get a genuinely separate copy of the environment/sky/material
	var original_env = world_environment.environment.duplicate(true) as Environment
	var original_sky = original_env.sky.duplicate(true) as Sky
	original_env.sky = original_sky
	reset = original_env # store this as the true original snapshot
	move_asteroid()

func move_asteroid():
	FlowController.toast_seconds_left = total_game_time
	is_moving = true
	var env = world_environment.environment.duplicate(true) as Environment
	var sky = env.sky.duplicate(true) as Sky
	var sky_material = sky.sky_material.duplicate(true) as ProceduralSkyMaterial
	sky.sky_material = sky_material
	env.sky = sky
	world_environment.environment = env # assign the fresh duplicated copy so we're not editing the shared original

	var tween = create_tween()
	tween.tween_property(self, "global_position", asteroid_state_positions[asteroid_state], total_game_time)\
		.set_trans(Tween.TRANS_LINEAR)

	var tween2 = create_tween()
	tween2.tween_property(sky_material, "sky_horizon_color", Color(119.0 / 255.0, 7.0 / 255.0, 21.0 / 255.0), total_game_time)

	var tween3 = create_tween()
	tween3.tween_property(env, "fog_light_color", Color(119.0 / 255.0, 7.0 / 255.0, 21.0 / 255.0), total_game_time)

	FlowController.set_move_camera(true)
	await get_tree().create_timer(total_game_time / 5).timeout
	asteroid_state += 1
	FlowController.toast_seconds_left -= total_game_time / 5
	FlowController.asteroid_state = asteroid_state
	print("Asteroid state: ", asteroid_state)
	FlowController.set_move_camera(true)

	await get_tree().create_timer(total_game_time / 5).timeout
	asteroid_state += 1
	FlowController.toast_seconds_left -= total_game_time / 5
	FlowController.asteroid_state = asteroid_state
	print("Asteroid state: ", asteroid_state)
	FlowController.set_move_camera(true)

	await get_tree().create_timer(total_game_time / 5).timeout
	asteroid_state += 1
	FlowController.toast_seconds_left -= total_game_time / 5
	FlowController.asteroid_state = asteroid_state
	FlowController.is_camera_shaking = true
	print("Asteroid state: ", asteroid_state)
	FlowController.set_move_camera(true)

	await get_tree().create_timer(total_game_time / 5).timeout
	asteroid_state += 1
	FlowController.toast_seconds_left -= total_game_time / 5
	FlowController.asteroid_state = asteroid_state
	print("Asteroid state: ", asteroid_state)
	FlowController.gameOver = true # set this FIRST, immediately
	FlowController.set_can_start_game(false)

	await tween.finished
	FlowController.end_game()
	world_environment.environment = reset # now reset holds a truly untouched original copy
