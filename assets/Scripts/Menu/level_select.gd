extends CanvasLayer

var hoverfocus = preload("res://assets/Sprites/Button/green_pressed.png")
var greenregular = preload("res://assets/Sprites/Button/green.png")
var regular = preload("res://assets/Sprites/Button/blue.png")
func _ready() -> void:
	$ColorRect/Tutorial.grab_focus()

#func _on_level_three_focus_entered():
	#%LevelThree.texture_normal = greenregular
	#if %LevelThree.pressed():
		#%LevelThree.texture_pressed = "res://assets/Sprites/Button/green_pressed.png"
	#else:
		#pass
	#print("WORKING")


func _on_escape_button_pressed() -> void:
	get_tree().create_timer(0.3)
	to_tutorial_transition.change_scene(to_tutorial_transition.back)

func _on_tutorial_pressed() -> void:
	get_tree().create_timer(0.3)
	to_tutorial_transition.change_scene(to_tutorial_transition.tutorial)

func _on_level_one_pressed() -> void:
	get_tree().create_timer(0.3)
	to_tutorial_transition.change_scene(to_tutorial_transition.levelone)

func _on_level_two_pressed() -> void:
	pass # Replace with function body.

func _on_level_three_pressed() -> void:
	pass # Replace with function body.
