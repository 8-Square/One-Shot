class_name AudioSettings extends Control
#
#
@onready var master: HSlider = $VBoxContainer/Master
@onready var music: HSlider = $VBoxContainer/Music
@onready var sfx: HSlider = $VBoxContainer/SFX

func _ready() -> void:
	master.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")))
	music.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music")))
	sfx.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX")))


func _on_master_mouse_exited() -> void:
	release_focus()
func _on_music_mouse_exited() -> void:
	release_focus()
func _on_sfx_mouse_exited() -> void:
	release_focus()

func _on_master_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Master"), value)
func _on_music_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Music"), value)
func _on_sfx_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("SFX"), value)

func save_settings():
	AudioServer.set_bus_volume_db(0, linear_to_db(master.value))
	AudioServer.set_bus_volume_db(1, linear_to_db(music.value))
	AudioServer.set_bus_volume_db(2, linear_to_db(sfx.value))
