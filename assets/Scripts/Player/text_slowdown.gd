class_name TextSlowdown extends Area2D

@export var normal_time: float = 1
@export var slowed_time: float = 0.2


func _on_body_entered(body: Node2D) -> void:
	if body is BasePlayer:
		Engine.time_scale = slowed_time


func _on_body_exited(body: Node2D) -> void:
	if body is BasePlayer:
		Engine.time_scale = normal_time
