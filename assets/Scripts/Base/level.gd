class_name Level extends Node2D

@onready var pause_menu_scene := $CanvasLayer/PauseMenu
@onready var player: BasePlayer = $Player
@onready var settings_menu: SettingsMenu = $SettingsMenu

@export var level_no: int
#@export var level_completed: bool

func _ready() -> void:
	settings_menu.menu_hide()

var paused := false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		pause_menu()

func pause_menu():
	paused = !paused
	get_tree().paused = paused
	pause_menu_scene.visible = paused
	if paused:
		$BackgroundMusic.stop()
		$CanvasLayer/PauseMenu/CanvasLayer.show()
		$CanvasLayer/PauseMenu/CanvasLayer/MarginContainer/VBoxContainer/Resume.grab_focus()
		player.can_control = false
	else:
		player.can_control = true
		$BackgroundMusic.play()
		$CanvasLayer/PauseMenu/CanvasLayer.hide()
	#if pause_menu() && Input.is_action_just_pressed("pause"):
		#pause_menu()



func level_complete():
	Globallevel.is_completed(level_no)
	print("LEVEL COMPLETE WORKS")


func _on_end_portal_level_finished() -> void:
	level_complete()
