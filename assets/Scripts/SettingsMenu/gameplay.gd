class_name GamePlaySettings extends Control
#
#@onready var button: Button = $VBoxContainer/HBoxContainer/Button
#@onready var check_button: CheckButton = $VBoxContainer/HBoxContainer/CheckButton

# Nodes for Delete Save
@onready var cancel: Button = $"../../RealDeletePanel/DeleteSavePanel/HBoxContainer/Cancel"
@onready var delete: Button = $"../../RealDeletePanel/DeleteSavePanel/HBoxContainer/Delete"
@onready var delete_save_button: Button = $VBoxContainer/DeleteSaveHoriz/DeleteSaveButton
@onready var gameplay_settings_text: VBoxContainer = $GameplaySettingsText
@onready var real_delete_panel: Panel = $"../../RealDeletePanel"
@onready var settings_menu: SettingsMenu = $"../../.."

var save_pref = SaveManager

func _ready() -> void:
	save_pref = SaveManager.load_or_create()

#var turned_on: bool = false
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
#func _on_check_button_pressed() -> void:
	#if not turned_on:
		#check_button.text = "On"
		#turned_on = true
	#else:
		#check_button.text = "Off"
		#turned_on = false


func _on_delete_save_button_pressed() -> void:
	gameplay_settings_text.hide()
	real_delete_panel.show()


func _on_delete_save_cancel_pressed() -> void:
	real_delete_panel.hide()
	gameplay_settings_text.show()


func _on_delete_pressed() -> void:
	print("Delete Button Pressed")
	save_pref.delete_save()
	settings_menu.reload()
	real_delete_panel.hide()
	gameplay_settings_text.show()
	

	
