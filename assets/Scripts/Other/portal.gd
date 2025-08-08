extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is BasePlayer:
		body.velocity = Vector2.ZERO
		body.set_position($Destination.global_position)
		
