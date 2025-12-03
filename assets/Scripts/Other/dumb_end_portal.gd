class_name DumbEndPortal extends EndPortal
#Player Finishes the level but DOES NOT COMPLETE IT

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
		LevelComplete.level_complete(current_path + "_dumb")
		
