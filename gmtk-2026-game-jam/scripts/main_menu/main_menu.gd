extends Node

@export var NextScene: PackedScene
@onready var title_music: AudioStreamPlayer2D = $title_music

var loop_track = preload("res://assets/Music/main_menu/title_loop.mp3")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_packed(NextScene)


func _on_title_music_finished() -> void:
	title_music.stream = loop_track
	title_music.play()
	
