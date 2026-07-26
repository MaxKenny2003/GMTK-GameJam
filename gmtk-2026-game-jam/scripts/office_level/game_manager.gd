extends Node

@export var micro_games: Array[PackedScene] = []
@export var end_game_delay: float = 1.0
@export var minimum_before_replay: int = 4
@export var game_over_screen: PackedScene
@export var score_label: RichTextLabel
@onready var transition: AudioStreamPlayer2D = $"../transition"

var intro_trans = preload("res://assets/Music/gametransition.mp3")
var win_trans = preload("res://assets/Music/gametransition_win.mp3")
var lose_trans = preload("res://assets/Music/gametransition_lose.mp3")

var waiting_queue: Array[PackedScene] = []
var instance: Node
var scene_name: String
var has_ended: bool = false

func _process(_delta: float):
	if FlowController.can_start_game and not FlowController.move_Camera and not FlowController.gameOver:
		if micro_games.size() > 0:
			print("Trying to start microgame")
			FlowController.set_can_start_game(false)
			var index = select_game()
			var scene = micro_games[index]
			scene_name = scene.resource_path.get_file().get_basename()
			# print("Starting scene: ", scene_name)
			start_game(index)

	if FlowController.gameOver and not has_ended:
		has_ended = true
		var over_instance = game_over_screen.instantiate()
		add_child(over_instance)

func start_game(index: int):
	var path = "res://scenes/microgames/%s/%s_instructions.tscn" % [scene_name, scene_name]
	var packed_scene = load(path) as PackedScene
	var instance2 = packed_scene.instantiate()
	add_child(instance2)
	transition.stream = intro_trans
	transition.play()
	print(path)
	await get_tree().create_timer(2.1).timeout
	instance2.queue_free()
	instance = micro_games[index].instantiate()
	add_child(instance)
	instance.connect("game_end", Callable(self, "_on_game_end"))
	add_game_to_waiting_queue(index)
	FlowController.set_is_in_game(true)

func add_game_to_waiting_queue(index: int):
	waiting_queue.push_back(micro_games[index])
	micro_games.remove_at(index)
	if micro_games.size() == 0:
		for game in waiting_queue:
			micro_games.append(game)
		waiting_queue.clear()
	if waiting_queue.size() >= minimum_before_replay:
		micro_games.append(waiting_queue.pop_front())

func select_game() -> int:
	return randi() % micro_games.size()

func _on_game_end(result: String):
	print("Game ended with result: ", result)
	if result == "win":
		print("Yippie")
		FlowController.set_score(FlowController.score + 1)
		transition.stream = win_trans
		if score_label != null:
			print("Adding to score")
			score_label.text = "Score: " + str(FlowController.score)
	if result == "lose":
		FlowController.lives -= 1
		transition.stream = lose_trans
	end_microgame()

func end_microgame():
	await get_tree().create_timer(end_game_delay).timeout
	instance.queue_free()
	transition.play()
	var tween = create_tween()
	var target_pos = Vector2(0, 24)
	tween.tween_property(score_label, "global_position", target_pos, 0.25)
	await get_tree().create_timer(2.3).timeout
	tween = create_tween()
	target_pos = Vector2(0, -56)
	tween.tween_property(score_label, "global_position", target_pos, 0.25)
	FlowController.set_can_start_game(true)
	FlowController.set_can_move_camera(true)
	FlowController.set_is_in_game(false)
