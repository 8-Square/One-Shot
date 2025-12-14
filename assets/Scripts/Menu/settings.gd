class_name SettingsMenu extends Control

@onready var master: HSlider = $Settings/MusicSettings/AudioOptions/VBoxContainer/Master
@onready var music: HSlider = $Settings/MusicSettings/AudioOptions/VBoxContainer/Music
@onready var sfx: HSlider = $Settings/MusicSettings/AudioOptions/VBoxContainer/SFX

func _ready() -> void:
	master.grab_click_focus()
	master.grab_focus()
	
	master.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")))
	music.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music")))
	sfx.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX")))


func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, value)

func _on_check_box_toggled(toggled_on: bool) -> void:
	pass # Replace with function body.


func _on_confirm_pressed() -> void:
	AudioServer.set_bus_volume_db(0, linear_to_db(master.value))
	AudioServer.set_bus_volume_db(1, linear_to_db(music.value))
	AudioServer.set_bus_volume_db(2, linear_to_db(sfx.value))
	to_tutorial_transition.change_scene(to_tutorial_transition.back)



func _on__value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Master"), value)


func _on_musicvol_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Music"), value)


func _on_sfx_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("SFX"), value)
