extends Control

func _ready():
	show_white()
	move_toast()

func show_white():
	var white_screen = get_node("ColorRect") as ColorRect
	print("Base Color: ", white_screen.color) # confirm this shows (1,1,1,1) or similar
	print("Modulate before: ", white_screen.modulate)
	white_screen.color = Color(1, 1, 1, 1) # force opaque white base color
	white_screen.modulate = Color(1, 1, 1, 0) # start fully faded out via modulate
	print("Modulate after reset: ", white_screen.modulate)
	var tween = create_tween()
	tween.tween_property(white_screen, "modulate:a", 1.0, 5)
	await tween.finished
	print("Tween done, changing scene")
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")

func move_toast():
	await get_tree().create_timer(1.0).timeout
	var toast_label = get_node("Label") as Label
	toast_label.text = "Maybe you should have shown up earlier\n Score: " + str(FlowController.instance.score)
	var tween1 = create_tween()
	tween1.tween_property(toast_label, "position", Vector2(18.0, 250.0), 2.0)
	await tween1.finished
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")
