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
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().create_timer(0.2)
	Stopwatch.stop()
	Stopwatch.reset()
	main.pause_menu()
	to_tutorial_transition.change_scene(to_tutorial_transition.back)
