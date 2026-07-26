extends Node2D

var is_stapled = false

var random_y 
var end_pos = Vector2(-450, 0)
var min_dist = 350
var max_dist = 475

var travel_time
var min_time = 3.5
var max_time = 6.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	random_y = randi_range(min_dist, max_dist)
	global_position.y = random_y
	end_pos.y = random_y
	var start_pos = global_position
	travel_time = randf_range(min_time, max_time)
	
	var tween = create_tween()
	tween.tween_property(self, "global_position", end_pos, travel_time)
	await tween.finished
	
	if !is_stapled:
		tween = create_tween()
		tween.tween_property(self, "global_position", start_pos, travel_time)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
