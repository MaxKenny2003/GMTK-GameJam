extends Control

var toastLabel: Label

func _ready():
	toastLabel = get_node("Label") as Label

func _process(_delta: float):
	if FlowController.send_toast:
		print("Toast seconds left: ", FlowController.toast_seconds_left)
		FlowController.set_send_toast(false)
		toastLabel.text = "%.2f seconds till impact" % FlowController.toast_seconds_left
		move_toast()

func move_toast():
	var tween1 = create_tween()
	tween1.tween_property(self, "position", Vector2(576.0, 350.0), 0.5)
	await tween1.finished
	await get_tree().create_timer(1.5).timeout

	var tween2 = create_tween()
	tween2.tween_property(self, "position", Vector2(576.0, 500), 0.5)
	await tween2.finished
