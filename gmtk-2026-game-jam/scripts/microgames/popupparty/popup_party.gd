extends Node2D

@export var PopupScene: PackedScene
@export var total_popups = 12
@onready var win_text: Label = $Label
var close_count = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_popups(total_popups)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func spawn_popups(count):
	for i in range(count):
		var popup = PopupScene.instantiate()
		randomize_position(popup)
		add_child(popup)
		
		popup.popup_closed.connect(_on_popup_closed)

func randomize_position(popup):
	var x = randf_range(0, 792)
	var y = randf_range(0, 364)
	popup.position = Vector2(x,y)

func _on_popup_closed() -> void:
	close_count += 1
	
	if close_count >= total_popups:
		win_text.visible = true
