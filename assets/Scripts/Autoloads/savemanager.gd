class_name SaveManager extends Resource

# Music Settings
@export_range(0, 1, 0.05) var master_audio_level: float = 1.0
@export_range(0, 1, 0.05) var music_audio_level: float = 1.0
@export_range(0, 1, 0.05) var sfx_audio_level: float = 1.0

# Display Settings
@export var window_mode: int = DisplayServer.WINDOW_MODE_WINDOWED
@export var window_resolution: Vector2i = Vector2i(1280, 720)
@export_range(10, 160, 10) var max_fps: float = 60.0
@export var vsync: bool = true


# Trying out a dictionary for level completed
@export var levels_completed: Array = [
	false, 
	false, 
	false, 
	false,
	false,
]

@export var levels_completed_w_names: Dictionary = {
	"Level One": false, 
	"Level Two": false, 
	"Level Three": false, 
	"Level Four": false, 
	"Level Five": false, 
}



func save() -> void:
	ResourceSaver.save(self, "user://save_manager.tres")
	
	

static func load_or_create() -> SaveManager:
	var res: SaveManager = load("user://save_manager.tres") as SaveManager
	if !res:
		res = SaveManager.new()
		res.save()
	return res

func wipe_save() -> void: 
	# wipe level saves 
	for levels in levels_completed:
		var level_finished = levels_completed_w_names[true]
		level_finished = false
		
			
	
