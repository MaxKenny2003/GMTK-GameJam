extends Node

var is_looking_at_computer: bool = true  # used to tell if we can start game
var move_Camera: bool = false            # Ready to move camera (command)
var can_move: bool = false               # Free to move next
var is_camera_shaking: bool = false      # Used to control camera shake
var can_start_game: bool = false         # Used to decide if we can start a microgame
var is_in_game: bool = false             # Used to tell if we are in a game
var send_toast: bool = false
var toast_seconds_left: float
var score: int = 0
var lives: int = 3
var asteroid_state: int = 0
var gameOver: bool = false

var scoreLabel: Label

# Reference to self, for parity with the old C# "Instance" pattern.
# Not strictly needed if this script is set up as an Autoload (see notes below).
static var instance: Node

func _ready():
	instance = self
	move_Camera = false
	is_looking_at_computer = true
	can_start_game = false
	is_camera_shaking = false
	score = 0
	can_move = false
	is_in_game = false
	gameOver = false

func set_can_move_camera(value: bool):
	can_move = value

func set_score(value: int):
	score = value

func set_move_camera(value: bool):
	move_Camera = value

func set_looking_at_computer(value: bool):
	is_looking_at_computer = value

func set_can_start_game(value: bool):
	can_start_game = value

func set_is_in_game(value: bool):
	is_in_game = value

func set_send_toast(value: bool):
	send_toast = value

func end_game():
	print("Game Over")
	# get_tree().change_scene_to_file("res://scenes/gameOver.tscn")
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	reset_state()
	# get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")

func reset_state():
	move_Camera = false
	is_looking_at_computer = true
	can_start_game = false
	is_camera_shaking = false
	score = 0
	lives = 3
	asteroid_state = 0
	can_move = false
	is_in_game = false
	gameOver = false
