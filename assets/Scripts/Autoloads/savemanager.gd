class_name SaveManager extends Resource

# Music Settings
@export_range(0, 1, 0.05) var master_audio_level: float = 1.0
@export_range(0, 1, 0.05) var music_audio_level: float = 1.0
@export_range(0, 1, 0.05) var audio_audio_level: float = 1.0

func save() -> void:
	ResourceSaver.save(self, "user://save_manager.tres")
	
	

static func load_or_create() -> SaveManager:
	var res: SaveManager = load("user://save_manager.tres") as SaveManager
	if !res:
		res = SaveManager.new()
	return res
