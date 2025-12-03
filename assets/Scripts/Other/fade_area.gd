class_name HiddenArea extends Area2D

# Creates a visible hidden area when player is inside
func _on_body_entered(body: Node2D) -> void:
	if body is BasePlayer:
		var parent = self.get_parent()
		if parent:
			parent.modulate.a = 0.2

# Hides hidden area when player moves out
func _on_body_exited(body: Node2D) -> void:
	if body is BasePlayer:
		var parent = self.get_parent()
		if parent:
			parent.modulate.a = 1
