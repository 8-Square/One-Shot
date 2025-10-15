extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is BasePlayer:
		body.set_position($Destination.global_position)
		
