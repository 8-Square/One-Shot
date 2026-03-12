class_name EndPortal extends Area2D
# Player Finishes level after entering
@onready var level_complete = $"/root/LevelComplete"
@onready var level_root = get_tree().current_scene
@onready var level_audio = level_root.get_node("BackgroundMusic")
@onready var level: Level = $".."

var leaderboard_time: float
var save_pref: SaveManager

func _ready() -> void:
	save_pref = SaveManager.load_or_create()

# haha end portal.... minecraft reference
func _on_body_entered(body: Node2D) -> void:
	var current_path = get_tree().current_scene.scene_file_path
	if body is BasePlayer:
		
		# Stops audio and plays level finished audio
		if is_instance_valid(level_audio):
			level_audio.stop()
		else: print("LEVEL AUDIO STOPPING NOT WORKING")
		$AudioStreamPlayer2D.play()
		
		# Stops stopwatch (for final time)
		Stopwatch.stop()
		
		# Offline Leaderboard
		#leaderboard_time = Stopwatch.time * 100000
		leaderboard_time = Stopwatch.time
		print(leaderboard_time)
		
		
		#var res := await Talo.leaderboards.add_entry(global_leaderboard, score)
		# Stops player
		body.velocity = Vector2.ZERO
		body.can_control = false
		
		#signals to levelcomplete
		LevelComplete.level_complete(current_path, leaderboard_time)
		
		
