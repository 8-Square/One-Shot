class_name Levels
extends Node2D

@onready var pause_menu_scene := $CanvasLayer/PauseMenu
var paused := false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		print("WORKING")
		pause_menu()

func pause_menu():
	paused = !paused
	get_tree().paused = paused
	pause_menu_scene.visible = paused
	if paused:
		$CanvasLayer/PauseMenu/CanvasLayer/ColorRect.show()
		$CanvasLayer/PauseMenu/MarginContainer/VBoxContainer/Resume	.grab_focus()
	else:
		$CanvasLayer/PauseMenu/CanvasLayer/ColorRect.hide()
	#if pause_menu() && Input.is_action_just_pressed("pause"):
		#pause_menu()
