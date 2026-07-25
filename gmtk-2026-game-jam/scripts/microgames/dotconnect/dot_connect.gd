extends Node2D

@onready var paper: TextureRect = $paper

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var travel_time = 1.75
	var start_pos = paper.global_position
	var end_pos = Vector2(start_pos.x, -732)
	var tween = create_tween()
	tween.tween_property(paper, "global_position", end_pos, travel_time)\
			.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
