class_name SaveManager extends Resource

# DEFAULT ONES
# Music Settings
const default_master_audio_level: float = 1.0
const default_music_audio_level: float = 1.0
const default_sfx_audio_level: float = 1.0

# Display Settings
const default_window_mode: int = DisplayServer.WINDOW_MODE_WINDOWED
const default_window_resolution: Vector2i = Vector2i(1280, 720)
const default_max_fps: float = 60.0
const default_vsync: bool = true

# Tutorial Completed
const default_comp_tutorial: bool = false

# REGULAR ONES
# Music Settings
@export_range(0, 1, 0.05) var master_audio_level: float = 1.0
@export_range(0, 1, 0.05) var music_audio_level: float = 1.0
@export_range(0, 1, 0.05) var sfx_audio_level: float = 1.0

# Display Settings
@export var window_mode: int = DisplayServer.WINDOW_MODE_WINDOWED
@export var window_resolution: Vector2i = Vector2i(1280, 720)
@export_range(10, 160, 10) var max_fps: float = 60.0
@export var vsync: bool = true


# Completed Tutorial (for Opening Screen)
@export var comp_tutorial: bool = false

# Trying out a dictionary for level completed
@export var levels_completed: Dictionary = {
	"level_one": false, 
	"level_two": false, 
	"level_three": false, 
	"level_four": false, 
	"level_five": false, 
}

func save() -> void:
	ResourceSaver.save(self, "user://save_manager.tres")
	

static func load_or_create() -> SaveManager:
	var res: SaveManager = load("user://save_manager.tres") as SaveManager
	if !res:
		res = SaveManager.new()
		res.save()
	return res


func delete_save() -> void: 
	print("DELETING SAVE")
	# wipe level saves 
	for levels in levels_completed:
		var level_finished = levels_completed[levels]
		level_finished = false
	# Resets to default values
	master_audio_level = default_master_audio_level
	music_audio_level = default_music_audio_level
	sfx_audio_level = default_sfx_audio_level
	window_mode = default_window_mode
	window_resolution = default_window_resolution
	max_fps = default_max_fps
	vsync = default_vsync
	comp_tutorial = default_comp_tutorial

#func reload():
	

# Completing the level
func completing_level(level_no):
	print("Completing level")
	match level_no:
		1:
			levels_completed["level_one"] = true
		2:
			levels_completed["level_two"] = true
		3:
			levels_completed["level_three"] = true
		4:
			levels_completed["level_four"] = true
		5:
			levels_completed["level_five"] = true
		#6:
			#levels_completed["level_five"] = true

func has_previous_level_completed(level_no) -> bool:
	var check_level: String
	print("Checking Level")
	match level_no:
		0:
			return true
		1:
			check_level = "level_one"
		2:
			check_level = "level_two"
		3:
			check_level = "level_three"
		4:
			check_level = "level_four"
		5:
			check_level = "level_five"
	
	# Check if check_level is valid and is in the Dictionary 
	if levels_completed.has(check_level):
		return levels_completed.has(check_level)
	else:
		return false

func completed_tutorial(set_value) -> bool:
	if comp_tutorial == default_comp_tutorial:
		comp_tutorial = true
		set_value = false
	elif comp_tutorial == !default_comp_tutorial:
		set_value = true
	return set_value
	
