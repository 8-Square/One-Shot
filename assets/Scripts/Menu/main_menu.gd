extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ColorRect/MarginContainer/VBoxContainer/Play.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_play_pressed() -> void:
	hide()
	to_tutorial_transition.change_scene(to_tutorial_transition.levelselect)

func _on_settings_pressed() -> void:
	pass # Replace with function body.

func _on_quit_pressed() -> void:
	await get_tree().create_timer(0.3).timeout
	get_tree().quit()
