extends Node2D
@onready var hand: Area2D = $Hand
@onready var smack_sprite: Sprite2D = $Hand/SmackSprite
@onready var hand_sprite: Sprite2D = $Hand/HandSprite

var fly_guts = preload("res://scenes/microgames/flyswatter/fly_guts.tscn")


var hand_offset = Vector2(0, -20)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	hand.global_position = mouse_pos - hand_offset


func _input(event: InputEvent):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed():
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
		print("Smack!")
		fly.queue_free()
