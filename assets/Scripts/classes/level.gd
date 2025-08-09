class_name Levels
extends Node2D

@onready var pause_menu_scene := $CanvasLayer/PauseMenu
var paused = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pause_menu()

func pause_menu():
	paused = !paused
	pause_menu_scene.visible = paused
	get_tree().paused = paused
	$CanvasLayer/PauseMenu/MarginContainer/VBoxContainer/Resume	.grab_focus()
