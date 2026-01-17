class_name EndPortal extends Area2D
# Player Finishes level after entering
@onready var level_complete = $"/root/LevelComplete"
@onready var level_root = get_tree().current_scene
@onready var level_audio = level_root.get_node("BackgroundMusic")

# haha end portal.... minecraft reference
func _on_body_entered(body: Node2D) -> void:
	if body is BasePlayer:
		
		# Stops audio and plays level finished audio
		if is_instance_valid(level_audio):
			level_audio.stop()
		else: print("LEVEL AUDIO STOPPING NOT WORKING")
		$AudioStreamPlayer2D.play()
		
		# Stops stopwatch (for final time)
		Stopwatch.stop()
		
		# Stops player
		body.velocity = Vector2.ZERO
		body.can_control = false
		
		#signals to levelcomplete
		var current_path = get_tree().current_scene.scene_file_path
		LevelComplete.level_complete(current_path)
		
		
