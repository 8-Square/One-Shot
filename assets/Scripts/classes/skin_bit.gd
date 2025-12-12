class_name SkinBit extends Node

@export var player_skins: Array[AnimatedSprite2D]

var animated_sprite: AnimatedSprite2D

func apply_skin(skin_index: int) -> void:
	for i in range(player_skins.size()):
		player_skins[i].visible = (i == skin_index)
	animated_sprite = player_skins[skin_index]
	animated_sprite.play("default")

func current_sprite() -> AnimatedSprite2D:
	return animated_sprite
