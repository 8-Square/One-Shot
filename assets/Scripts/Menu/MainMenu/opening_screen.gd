class_name OpeningScreen extends DefaultMenu

var completed_tutorial: bool = false
var save_pref: SaveManager
@onready var settings_menu: SettingsMenu = $SettingsMenu

func _ready() -> void:
	$CanvasLayer/MarginContainer/VBoxContainer/Play.grab_focus()
	save_pref = SaveManager.load_or_create()
	settings_menu.menu_hide()
	
	if save_pref.completed_tutorial():
		get_tree().change_scene_to_file("res://assets/Scenes/Menu/MainMenu.tscn")
		print("SENDING THEM TO MAIN MENU")
	else:
		pass


func _on_play_pressed() -> void:
	canvas_layer.hide()
	$UISelect.play()
	to_tutorial_transition.change_scene(to_tutorial_transition.tutorial)
	save_pref.completed_tutorial()
	save_pref.save()

func _on_settings_pressed() -> void:
	canvas_layer.hide()
	$UISelect.play()
	settings_menu.initiate()
	settings_menu.show()


func _on_quit_pressed() -> void:
	canvas_layer.hide()
	$QuitSound.play()
	await get_tree().create_timer(0.3).timeout
	get_tree().quit()

func _on_credits_pressed() -> void:
	canvas_layer.hide()
	$UISelect.play()
	to_tutorial_transition.change_scene(to_tutorial_transition.credits)
