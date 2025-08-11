extends Control


func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, value)

func _on_check_box_toggled(toggled_on: bool) -> void:
	pass # Replace with function body.


func _on_confirm_pressed() -> void:
	AudioServer.set_bus_volume_db(0, linear_to_db($AudioOptions/VBoxContainer/Master.value))
	AudioServer.set_bus_volume_db(1, linear_to_db($AudioOptions/VBoxContainer/Music.value))
	AudioServer.set_bus_volume_db(2, linear_to_db($AudioOptions/VBoxContainer/SFX.value))
	to_tutorial_transition.change_scene(to_tutorial_transition.back)

func _ready() -> void:
	$AudioOptions/VBoxContainer/Master.grab_click_focus()
	$AudioOptions/VBoxContainer/Master.grab_focus()
	
	$AudioOptions/VBoxContainer/Master.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")))
	$AudioOptions/VBoxContainer/Music.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music")))
	$AudioOptions/VBoxContainer/SFX.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX")))


func _on__value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Master"), value) # Replace with function body.


func _on_musicvol_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Music"), value) # Replace with function body.


func _on_sfx_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("SFX"), value) # Replace with function body.
