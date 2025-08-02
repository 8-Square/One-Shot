extends CanvasLayer


func _ready() -> void:
	$ColorRect/Tutorial.grab_focus()


func _on_escape_button_pressed() -> void:
	await get_tree().create_timer(0.3)
	to_tutorial_transition.change_scene(to_tutorial_transition.back)

func _on_tutorial_pressed() -> void:
	await get_tree().create_timer(0.3)
	to_tutorial_transition.change_scene(to_tutorial_transition.tutorial)

func _on_level_one_pressed() -> void:
	await get_tree().create_timer(0.3)
	to_tutorial_transition.change_scene(to_tutorial_transition.levelone)

func _on_level_two_pressed() -> void:
	pass # Replace with function body.

func _on_level_three_pressed() -> void:
	pass # Replace with function body.
