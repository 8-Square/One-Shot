class_name MainMenu extends DefaultMenu

#@export var player_skins: Array[AnimatedSprite2D]

@onready var skin_bit: SkinBit = $SkinBit
@onready var settings_menu: SettingsMenu = $SettingsMenu

var animated_sprite: AnimatedSprite2D

func _ready() -> void:
	$CanvasLayer/MarginContainer/VBoxContainer/Play.grab_focus()
	skin_bit.apply_skin(Globalskin.selected_skin_index)
	animated_sprite = skin_bit.current_sprite()



func _on_play_pressed() -> void:
	canvas_layer.hide()
	$UISelect.play()
	to_tutorial_transition.change_scene(to_tutorial_transition.levelselect)

func _on_settings_pressed() -> void:
	canvas_layer.hide()
	$UISelect.play()
	settings_menu.initiate()
	settings_menu.show()

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
