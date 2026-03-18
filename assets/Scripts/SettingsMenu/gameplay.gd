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

@onready var hard_mode_toggle: CheckButton = $GameplaySettingsText/HardModeHoriz/HardModeToggle

var save_pref = SaveManager
var turned_on: bool = false

func _ready() -> void:
	save_pref = SaveManager.load_or_create()
	hard_mode_toggle.button_pressed = save_pref.hard_mode
	hard_mode_toggle.text = "On" if save_pref.hard_mode else "Off"

func _on_check_button_pressed() -> void:
	hard_mode_toggle.text = "On" if hard_mode_toggle.button_pressed else "Off"


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
	
func save_settings():
	if save_pref:
		save_pref.hard_mode = hard_mode_toggle.button_pressed
		save_pref.save()
