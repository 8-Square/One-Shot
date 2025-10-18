extends Area2D
@onready var level_complete = $"/root/LevelComplete"
@onready var level_root = get_tree().current_scene
@onready var level_audio = level_root.get_node("AudioStreamPlayer")

# haha end portal.... minecraft reference


func _on_body_entered(body: Node2D) -> void:
	if body is BasePlayer:
		if is_instance_valid(level_audio):
			level_audio.stop()
		else: print("LEVEL AUDIO STOPPING NOT WORKING")
		Stopwatch.stop()
		body.velocity = Vector2.ZERO
		body.can_control = false
		$AudioStreamPlayer2D.play()
		var current_path = get_tree().current_scene.scene_file_path
		LevelComplete.level_complete(current_path)
		
