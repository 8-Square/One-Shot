class_name MainMenu extends Control

@export var player_skins: Array[AnimatedSprite2D]

@onready var canvas_layer: CanvasLayer = $CanvasLayer

var animated_sprite: AnimatedSprite2D

func _ready() -> void:
	$CanvasLayer/MarginContainer/VBoxContainer/Play.grab_focus()
	var skin_index = Globalskin.selected_skin_index
	apply_skin(skin_index)

func apply_skin(skin_index: int) -> void:
	for i in range(player_skins.size()):
		player_skins[i].visible = (i == skin_index)
	animated_sprite = player_skins[skin_index]
	animated_sprite.play("default", 0.7)

func _on_play_pressed() -> void:
	canvas_layer.hide()
	$UISelect.play()
	to_tutorial_transition.change_scene(to_tutorial_transition.levelselect)

func _on_settings_pressed() -> void:
	canvas_layer.hide()
	$UISelect.play()
	to_tutorial_transition.change_scene(to_tutorial_transition.settings)


func _on_quit_pressed() -> void:
	canvas_layer.hide()
	$QuitSound.play()
	await get_tree().create_timer(0.3).timeout
	get_tree().quit()

func _on_credits_pressed() -> void:
	canvas_layer.hide()
	$UISelect.play()
	to_tutorial_transition.change_scene(to_tutorial_transition.credits)


func _on_skin_pressed() -> void:
	canvas_layer.hide()
	$UISelect.play()
	to_tutorial_transition.change_scene(to_tutorial_transition.skins)
