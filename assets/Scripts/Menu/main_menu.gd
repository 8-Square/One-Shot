extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ColorRect/MarginContainer/VBoxContainer/Play.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_play_pressed() -> void:
	hide()
	$UISelect.play()
	to_tutorial_transition.change_scene(to_tutorial_transition.levelselect)

func _on_settings_pressed() -> void:
	$UISelect.play()
	to_tutorial_transition.change_scene(to_tutorial_transition.settings)


func _on_quit_pressed() -> void:
	$QuitSound.play()
	await get_tree().create_timer(0.3).timeout
	get_tree().quit()

func _on_credits_pressed() -> void:
	$UISelect.play()
	to_tutorial_transition.change_scene(to_tutorial_transition.credits)
