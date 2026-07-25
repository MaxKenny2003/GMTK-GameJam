extends Control

@onready var timer: Timer = $Timer
@onready var label: Label = $Label
@onready var texture_rect: ColorRect = $TextureRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_timer()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = str(snapped(timer.time_left, 0.1))
	

func start_timer():
	timer.start()
	

func start_microgame():
	pass
