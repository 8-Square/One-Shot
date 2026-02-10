class_name AudioSettings extends Control

# SO i kind of have ZERO CLUE as to whats going on here, I tried so many things and I think This Works
# Never wanted to crash out more than this :heavysob:
# To any poor soul reading this: I'm sorry.

# Defines Horizontal Slider to a variable 
@onready var master: HSlider = $VBoxContainer/Master
@onready var music: HSlider = $VBoxContainer/Music
@onready var sfx: HSlider = $VBoxContainer/SFX

# Previous sound, in case of exiting
var previous_master: float
var previous_music: float
var previous_sfx: float


# Save File
var save_pref: SaveManager

func _ready() -> void:
	# Save Manager
	save_pref = SaveManager.load_or_create()
	
	master.set_block_signals(true)
	
	if master:
		master.value = save_pref.master_audio_level
	if music:
		music.value = save_pref.music_audio_level
	if sfx:
		sfx.value = save_pref.sfx_audio_level
	
	master.set_block_signals(false)
	# Sets audioServer to values (save pref, as declared above)
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Master"), master.value)
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Music"), music.value)
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("SFX"), sfx.value)
	
	# Sets as previous in case of exitting 
	previous_master = master.value
	previous_music = music.value
	previous_sfx = sfx.value
	
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
func _on_music_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Music"), value)
func _on_sfx_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("SFX"), value)




func save_settings():
	# Sets the value of sound from the bars
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Master"), master.value)
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Music"), music.value)
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("SFX"), sfx.value)
	previous_master = master.value
	previous_music = music.value
	previous_sfx = sfx.value
	
	if save_pref:  
		save_pref.master_audio_level = master.value
		save_pref.music_audio_level = music.value
		save_pref.sfx_audio_level = sfx.value
		save_pref.save()


# In case if someone decides to quit
func exit_settings():
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Master"), previous_master)
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Music"), previous_music)
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("SFX"), previous_sfx)
	
