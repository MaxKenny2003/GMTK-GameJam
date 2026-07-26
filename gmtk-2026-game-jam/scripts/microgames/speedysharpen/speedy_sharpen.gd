extends Node2D

@onready var crank_pivot: Node2D = $crank_pivot

signal game_end(outcome: String)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	crank_pivot.connect("game_end1", Callable(self, "_game_has_ended"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _game_has_ended(outcome):
	emit_signal("game_end", outcome)
