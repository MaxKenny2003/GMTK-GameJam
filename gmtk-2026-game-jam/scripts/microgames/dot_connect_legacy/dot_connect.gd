extends Node2D

@onready var paper: TextureRect = $paper
@onready var dot1A: Sprite2D = $paper/first_letter/dot
@onready var dot2A: Sprite2D = $paper/first_letter/dot2
@onready var dot3A: Sprite2D = $paper/first_letter/dot3
@onready var dot4A: Sprite2D = $paper/first_letter/dot4
@onready var dot5A: Sprite2D = $paper/first_letter/dot5
@onready var dot1B: Sprite2D = $paper/second_letter/dot
@onready var dot2B: Sprite2D = $paper/second_letter/dot2
@onready var dot3B: Sprite2D = $paper/second_letter/dot3
@onready var dot4B: Sprite2D = $paper/second_letter/dot4
@onready var dot1C: Sprite2D = $paper/third_letter/dot
@onready var dot2C: Sprite2D = $paper/third_letter/dot2
@onready var dot3C: Sprite2D = $paper/third_letter/dot3
@onready var dot4C: Sprite2D = $paper/third_letter/dot4
@onready var lineA: Line2D = $first_line
@onready var lineB: Line2D = $second_line
@onready var lineC: Line2D = $third_line

var drawing = false
var current_line: Line2D
var target_pointsA: Array = []
var target_pointsB: Array = []
var target_pointsC: Array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var travel_time = 1.75
	var start_pos = paper.global_position
	var end_pos = Vector2(start_pos.x, -732)
	var tween = create_tween()
	tween.tween_property(paper, "global_position", end_pos, travel_time)\
			.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
	await tween.finished
	target_pointsA.append(dot1A.global_position)
	target_pointsA.append(dot2A.global_position)
	target_pointsA.append(dot3A.global_position)
	target_pointsA.append(dot4A.global_position)
	target_pointsA.append(dot5A.global_position)
	target_pointsB.append(dot1B.global_position)
	target_pointsB.append(dot2B.global_position)
	target_pointsB.append(dot3B.global_position)
	target_pointsB.append(dot4B.global_position)
	target_pointsC.append(dot1C.global_position)
	target_pointsC.append(dot2C.global_position)
	target_pointsC.append(dot3C.global_position)
	target_pointsC.append(dot4C.global_position)
	print(dot1A.global_position)
	print(dot2A.global_position)
	print(dot3A.global_position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	print(current_line)

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		drawing = event.pressed
		if not drawing and current_line:
			check_signature()
			mark_letter_complete(current_line)
	elif event is InputEventMouseMotion and drawing and current_line:
		current_line.add_point(event.position)

func check_signature() -> void:
	pass

func mark_letter_complete(line: Line2D) -> void:
	pass

func check_all_letters() -> void:
	pass

func _on_area_a_mouse_shape_exited(_shape_idx: int) -> void:
	current_line = null

func _on_area_b_mouse_shape_exited(_shape_idx: int) -> void:
	current_line = null

func _on_area_c_mouse_shape_exited(_shape_idx: int) -> void:
	current_line = null


func _on_area_a_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	current_line = lineA


func _on_area_b_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	current_line = lineB


func _on_area_c_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	current_line = lineC
