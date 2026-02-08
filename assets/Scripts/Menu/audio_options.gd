class_name AudioSettings extends Control

# SO i kind of have ZERO CLUE as to whats going on here, I tried so many things and I think This Works
# Never wanted to crash out more than this :heavysob:
# To any poor soul reading this: I'm sorry.

# Defines Horizontal Slider to a variable 
@onready var master: HSlider = $VBoxContainer/Master
@onready var music: HSlider = $VBoxContainer/Music
@onready var sfx: HSlider = $VBoxContainer/SFX

var master_sound: float
var music_sound: float
var sfx_sound: float

# Previous sound, in case of exiting
var previous_master: float
var previous_music: float
var previous_sfx: float


var master_val 
var music_val 
var sfx_val 

# Save File
var save_pref: SaveManager

func _ready() -> void:
	save_pref = SaveManager.load_or_create()
	
	master_val = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")))
	music_val = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music")))
	sfx_val = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX")))
	
	master.value = master_val
	music.value = music_val
	sfx.value = sfx_val
	
	master_sound = master_val
	music_sound = music_val
	sfx_sound = sfx_val
	
	previous_master = master_val
	previous_music = music_val
	previous_sfx = sfx_val
	
func _on_master_mouse_exited() -> void:
	release_focus()
func _on_music_mouse_exited() -> void:
	release_focus()
func _on_sfx_mouse_exited() -> void:
	release_focus()

# Sets values but also saves to master for some weird ahh reason, pretty sure it wouldnt
# work without master
func _on_master_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Master"), value)
	master_sound = value
func _on_music_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Music"), value)
	music_sound = value
func _on_sfx_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("SFX"), value)
	sfx_sound = value

func save_settings():
	# Sets the value of sound from the bars
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Master"), master_sound)
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Music"), music_sound)
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("SFX"), sfx_sound)
	previous_master = master_sound
	previous_music = music_sound
	previous_sfx = sfx_sound

# In case if someone decides to quit
func exit_settings():
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Master"), previous_master)
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Music"), previous_music)
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("SFX"), previous_sfx)
