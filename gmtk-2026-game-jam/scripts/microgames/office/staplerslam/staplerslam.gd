extends Node2D

@onready var stapler: AnimatedSprite2D = $stapler
@onready var staplerarea: Area2D = $stapler/staplerarea
@onready var label: Label = $Label

@export var stapler_offset: Vector2 = Vector2(0,90)
@export var StapleScene: PackedScene

var overlapping_area: Array[Area2D] = []
var pending_staple = false
var last_area: Node2D
var staple_counter = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	stapler.global_position = mouse_pos - stapler_offset
	if staple_counter == 3:
		label.visible = true

func _physics_process(_delta: float) -> void:
	if not pending_staple:
		return
	
	pending_staple = false
	
	if not _is_overlapping_now():
		return
	
	if last_area.is_stapled == true:
		return
	
	last_area.is_stapled = true
	
	_spawn_staple()

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed():
			pending_staple = true
				

func _spawn_staple():
	if StapleScene == null:
		return
	
	var mouse_pos = get_global_mouse_position()
	var staple = StapleScene.instantiate()
	last_area.add_child(staple)
	staple.global_position = mouse_pos
	staple_counter += 1

func _is_overlapping_now() -> bool:
	for area in staplerarea.get_overlapping_areas():
		last_area = area.get_parent()
		return true
	return false
