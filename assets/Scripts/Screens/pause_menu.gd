extends Control

@onready var main = $"../../"
#
#
#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("pause"):
		#print("WORKING")
		#main.pause_menu()

func _on_resume_pressed() -> void:
	main.pause_menu()


func _on_restart_pressed() -> void:
	get_tree().create_timer(0.1)
	main.pause_menu()
	Stopwatch.stop()
	Stopwatch.reset()
	match get_tree().current_scene.scene_file_path:
		"res://assets/Scenes/Levels/Tutorial.tscn":
			to_tutorial_transition.change_scene(to_tutorial_transition.tutorial)
		"res://assets/Scenes/Levels/LevelOne.tscn":
			to_tutorial_transition.change_scene(to_tutorial_transition.levelone)
		"res://assets/Scenes/Levels/LevelTwo.tscn":
			to_tutorial_transition.change_scene(to_tutorial_transition.leveltwo)
		"res://assets/Scenes/Levels/LevelThree.tscn":
			to_tutorial_transition.change_scene(to_tutorial_transition.levelthree)


func _on_quit_pressed() -> void:
	get_tree().create_timer(0.2)
	Stopwatch.stop()
	Stopwatch.reset()
	main.pause_menu()
	to_tutorial_transition.change_scene(to_tutorial_transition.back)
