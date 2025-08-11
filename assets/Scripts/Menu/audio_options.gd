extends Control
#
#
func _ready() -> void:
	$VBoxContainer/Master.value = db_to_linear(AudioServer.get_bus_volume_db(0))
	$VBoxContainer/Music.value = db_to_linear(AudioServer.get_bus_volume_db(1))
	$VBoxContainer/SFX.value = db_to_linear(AudioServer.get_bus_volume_db(2))


func _on_master_mouse_exited() -> void:
	release_focus()


func _on_music_mouse_exited() -> void:
	release_focus()



func _on_sfx_mouse_exited() -> void:
	release_focus()
