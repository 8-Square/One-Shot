extends Area2D


# haha end portal.... minecraft reference


func _on_body_entered(body: Node2D) -> void:
	if body is BasePlayer:
		Stopwatch.stop()
		body.velocity = Vector2.ZERO
		body.can_control = false
		var current_path = get_tree().current_scene.scene_file_path
		LevelComplete.level_complete(current_path)
		
