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

# Gameplay
const default_hard_mode: bool = false

# REGULAR ONES
@export var save_version: int = 1

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
@export var next_time_comp_tutorial: bool = false

# Trying out a dictionary for level completed
@export var levels_completed: Dictionary = {
	"level_one": false, 
	"level_two": false, 
	"level_three": false, 
	"level_four": false, 
	"level_five": false, 
	"level_six": false, 
	"level_seven": false, 
}

# LEVEL TIMES
@export var leaderboard_level_times: Dictionary = {
	# 0 Being Tutorial
	0: [9999999, 9999999, 9999999],
	1: [9999999, 9999999, 9999999],
	2: [9999999, 9999999, 9999999],
	3: [9999999, 9999999, 9999999],
	4: [9999999, 9999999, 9999999],
	5: [9999999, 9999999, 9999999],
	6: [9999999, 9999999, 9999999],
	7: [9999999, 9999999, 9999999],
	8: [9999999, 9999999, 9999999]
}

@export var hard_mode: bool = false
@export var hard_mode_leaderboard_level_times: Dictionary = {
	# 0 Being Tutorial
	0: [9999999, 9999999, 9999999],
	1: [9999999, 9999999, 9999999],
	2: [9999999, 9999999, 9999999],
	3: [9999999, 9999999, 9999999],
	4: [9999999, 9999999, 9999999],
	5: [9999999, 9999999, 9999999],
	6: [9999999, 9999999, 9999999],
	7: [9999999, 9999999, 9999999],
	8: [9999999, 9999999, 9999999]
}



func save() -> SaveManager:
	ResourceSaver.save(self, "user://save_manager.tres")
	return self


static func load_or_create() -> SaveManager:
	var res: SaveManager = load("user://save_manager.tres") as SaveManager
	if !res:
		res = SaveManager.new()
		res.save()
	if res.save_version > 2:
		res.save_version = 2
	return res


func delete_save() -> SaveManager: 
	print("DELETING SAVE")
	var fresh_save = SaveManager.new()
	ResourceSaver.save(fresh_save, "user://save_manager.tres")
	return fresh_save
	## wipe level saves 
	#for levels in levels_completed:
		#levels_completed[levels] = false
	#
	## Wipe regular leaderboard 
	#for times in leaderboard_level_times:
		#for i in range(leaderboard_level_times[times].size()):
			#leaderboard_level_times[times][i] = 9999999
	#
	## Wipe Hard Mode leaderboard 
	#for times in hard_mode_leaderboard_level_times:
		#for i in range(hard_mode_leaderboard_level_times[times].size()):
			#hard_mode_leaderboard_level_times[times][i] = 9999999
	#
	## Resets to default values
	#master_audio_level = default_master_audio_level
	#music_audio_level = default_music_audio_level
	#sfx_audio_level = default_sfx_audio_level
	#window_mode = default_window_mode
	#window_resolution = default_window_resolution
	#max_fps = default_max_fps
	#vsync = default_vsync
	#comp_tutorial = default_comp_tutorial
	#next_time_comp_tutorial = default_comp_tutorial
	#
	#hard_mode = default_hard_mode
	#
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
		6:
			levels_completed["level_six"] = true
		7:
			levels_completed["level_seven"] = true
# Leaderboard Time
func level_final_time(level_no, final_time):
		var level_time = leaderboard_level_times[int(level_no)]
		# NOT TOO SURE WHICH METHOD I PREFER MORE
		#if !(final_time < level_time[2]):
			#if !(final_time < level_time[1]):
				#if !(final_time < level_time[0]):
					#pass
				#else:
					#level_time[2] = level_time[1]
					#level_time[1] = level_time[0]
					#level_time[0] = final_time
			#else:
				#level_time[2] = level_time[1]
				#level_time[1] = final_time
		#else:
			#level_time[2] = final_time

		# ILL USE THIS ONE FOR NOW 
		if final_time < level_time[0]:
			level_time[2] = level_time[1]
			level_time[1] = level_time[0]
			level_time[0] = final_time
		elif final_time < level_time[1]:
			level_time[2] = level_time[1]
			level_time[1] = final_time
		elif final_time < level_time[2]:
			level_time[2] = final_time

		print(level_time[0])
		print(level_time[1])
		print(level_time[2])

# Hard Leaderboard Time
func hard_level_final_time(level_no, final_time):
		var level_time = hard_mode_leaderboard_level_times[int(level_no)]

		# ILL USE THIS ONE FOR NOW 
		if final_time < level_time[0]:
			level_time[2] = level_time[1]
			level_time[1] = level_time[0]
			level_time[0] = final_time
		elif final_time < level_time[1]:
			level_time[2] = level_time[1]
			level_time[1] = final_time
		elif final_time < level_time[2]:
			level_time[2] = final_time

		print(level_time[0])
		print(level_time[1])
		print(level_time[2])

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
		6:
			check_level = "level_six"
		7:
			check_level = "level_seven"
	
	# Check if check_level is valid and is in the Dictionary 
	if levels_completed.has(check_level):
		return levels_completed[check_level]
	else:
		return false

func completed_tutorial() -> bool:
	if comp_tutorial == default_comp_tutorial:
		comp_tutorial = true
		next_time_comp_tutorial = false
	elif comp_tutorial == !default_comp_tutorial:
		next_time_comp_tutorial = true
	return next_time_comp_tutorial
