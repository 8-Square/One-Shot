class_name HardPortal extends Portal

# Moves Player to destination, Player KEEPS velocity
func _on_body_entered(body: Node2D) -> void:
	if body is BasePlayer:
		body.set_position($Destination.global_position)
		
