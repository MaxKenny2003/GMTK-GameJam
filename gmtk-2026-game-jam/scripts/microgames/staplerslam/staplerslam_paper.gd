extends Node2D

@onready var effects_2: AudioStreamPlayer2D = $"../effects2"
var is_stapled = false

var random_y 
var end_pos = Vector2(-300, 0)
var min_dist = 225
var max_dist = 375

var travel_time
var min_time = 4.0
var max_time = 6.0

var heading_left = true
var heading_right = false

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
		heading_left = false
		heading_right = true
		tween = create_tween()
		tween.tween_property(self, "global_position", start_pos, travel_time)


func _on_left_zone_area_exited(_area: Area2D) -> void:
	if heading_right == true:
		effects_2.play()


func _on_right_zone_area_exited(_area: Area2D) -> void:
	if heading_left == true:
		effects_2.play()
