extends Node2D

@onready var pause_menu_scene := $CanvasLayer/PauseMenu

@export var level_no: int
#@export var level_completed: bool


var paused := false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		pause_menu()

func pause_menu():
	paused = !paused
	get_tree().paused = paused
	pause_menu_scene.visible = paused
	if paused:
		$AudioStreamPlayer.stop()
		$CanvasLayer/PauseMenu/CanvasLayer/ColorRect.show()
		$CanvasLayer/PauseMenu/MarginContainer/VBoxContainer/Resume	.grab_focus()
	else:
		$AudioStreamPlayer.play()
		$CanvasLayer/PauseMenu/CanvasLayer/ColorRect.hide()
	#if pause_menu() && Input.is_action_just_pressed("pause"):
		#pause_menu()



func level_complete():
	#level_completed = true	
	Globallevel.is_completed(level_no)
	print("LEVEL COMPLETE WORKS")


func _on_end_portal_level_finished() -> void:
	level_complete()
