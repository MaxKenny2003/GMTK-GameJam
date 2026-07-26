extends Node2D

@export var TimerScene: PackedScene
@onready var hand: Area2D = $Hand
@onready var smack_sprite: Sprite2D = $Hand/SmackSprite
@onready var hand_sprite: Sprite2D = $Hand/HandSprite
@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var results: Label = $Label
@onready var squish: AudioStreamPlayer2D = $effects

var score = 0
var end = false

var fly_guts = preload("res://scenes/microgames/flyswatter/fly_guts.tscn")
var timer_bar_instance

signal game_end(outcome: String)
  
var hand_offset = Vector2(0, -20)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	timer_bar_instance = TimerScene.instantiate()
	canvas_layer.add_child(timer_bar_instance)
	timer_bar_instance.connect("time_up", Callable(self, "_on_timer_up"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	if !end:
		hand.global_position = mouse_pos - hand_offset
	
	if score == 4 and !end:
		results.visible = true
		end = true
		timer_bar_instance.stop_timers()
		game_has_ended("win")


func _input(event: InputEvent):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed() and !end:
			smack();

func smack():
	if hand_sprite.is_visible:
		check_for_fly()
		hand_sprite.hide()
		smack_sprite.show()
		await get_tree().create_timer(0.4).timeout
	smack_sprite.hide()
	hand_sprite.show()

func check_for_fly():
	for fly in hand.get_overlapping_bodies():
		var fly_hit = fly_guts.instantiate()
		fly_hit.position = fly.position
		add_child(fly_hit)
		score += 1
		print("Smack!")
		squish.play()
		fly.queue_free()

func _on_timer_up():
	results.text = "You're Loser!"
	results.visible = true
	game_has_ended("lose")

func game_has_ended(result: String):
	await get_tree().create_timer(0.5).timeout
	emit_signal("game_end", result)
