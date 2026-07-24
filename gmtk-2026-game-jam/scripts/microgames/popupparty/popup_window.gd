extends Control

signal popup_closed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_x_button_pressed() -> void:
	emit_signal("popup_closed")
	queue_free()


func _on_okay_button_pressed() -> void:
	emit_signal("popup_closed")
	queue_free()
