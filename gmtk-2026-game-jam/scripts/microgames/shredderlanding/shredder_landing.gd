extends Node2D

@onready var win_text: Label = $Label
@onready var win_area: Area2D = $shredder_front/Area2D
@onready var paper: CharacterBody2D = $paper

var running = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_area_2d_body_entered(_body: Node2D) -> void:
	win_text.visible = true
