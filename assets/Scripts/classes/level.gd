class_name Levels
extends Node2D

@onready var pause_menu_scene := $PauseMenu
var paused = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pause_menu()

func pause_menu():
	if paused == true:
		pause_menu_scene.hide()
		Engine.time_scale = 1
		paused = false
	elif paused == false:
		pause_menu_scene.show()
		Engine.time_scale = 0
		paused = true
