extends CanvasLayer

func _ready() -> void:
	$ColorRect/EscapeButton.grab_focus()

#func _on_level_three_focus_entered():
	#%LevelThree.texture_normal = greenregular
	#if %LevelThree.pressed():
		#%LevelThree.texture_pressed = "res://assets/Sprites/Button/green_pressed.png"
	#else:
		#pass
	#print("WORKING")


func _on_escape_button_pressed() -> void:
	$UISelect.play()
	get_tree().create_timer(0.3)
	to_tutorial_transition.change_scene(to_tutorial_transition.back)
