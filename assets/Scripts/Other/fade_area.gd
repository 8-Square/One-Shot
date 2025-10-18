extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is BasePlayer:
		var parent = self.get_parent()
		if parent:
			parent.modulate.a = 0.2

func _on_body_exited(body: Node2D) -> void:
	if body is BasePlayer:
		var parent = self.get_parent()
		if parent:
			parent.modulate.a = 1
