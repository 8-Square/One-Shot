class_name DangerZone extends Area2D
# Kills the player when the player is inside

func _on_body_entered(body: Node2D) -> void:
	if body is BasePlayer:
		body.handle_danger()
		$AudioStreamPlayer2D.play()
