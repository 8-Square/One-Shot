class_name SkinSelection extends Control


@onready var label: Label = $Label
@onready var previousone: TextureButton = $CanvasLayer/Previous

@export var skins: Array[AnimatedSprite2D]

var left_pos := Vector2(-201, -61)
var center_pos := Vector2(-51, -61)
var right_pos := Vector2(99, -61)

var current_index: int = 0


func _ready() -> void:
	previousone.grab_focus()
	update_display()

func update_display() -> void:
	#for skin in skins:
		#skin.visible = false
		#skin.pause()
		#skin.play("RESET")
	
	var left_index = wrapi(current_index + 1, 0, skins.size())
	var right_index = wrapi(current_index - 1, 0, skins.size())
	
	var center_skin = skins[current_index]
	center_skin.position = center_pos
	center_skin.scale = Vector2(4.3, 4.3)
	center_skin.visible = true
	center_skin.self_modulate = Color(1, 1, 1, 1)
	center_skin.play("default")
	
	var right_skin = skins[right_index]
	right_skin.position = right_pos
	right_skin.scale = Vector2(4.0, 4.0)
	right_skin.visible = true
	#right_skin.self_modulate = Color(0.6, 0.6, 0.6, 0.5)
	right_skin.self_modulate = Color(1, 1, 1, 0.5)
	right_skin.pause()
	
	var left_skin = skins[left_index]
	left_skin.position = left_pos
	left_skin.scale = Vector2(4.0, 4.0)
	left_skin.visible = true
	left_skin.self_modulate = Color(1, 1, 1, 0.5)
	left_skin.pause()
	
	
	# NAMING LABEL
	var slime_name: String
	var slime = str(current_index)
	
	match slime:
		"0": slime_name = "Green"
		"1": slime_name = "Blue"
		"2": slime_name = "Red"
		"4": slime_name = "Brown"
		"5": slime_name = "Purple"
		"6": slime_name = "Dark"
		"7": slime_name = "Light"

	label.text = slime_name + " Slime"


func _on_previous_pressed() -> void:
	current_index = wrapi(current_index - 1, 0, skins.size())

	update_display()

func _on_next_pressed() -> void:
	current_index = wrapi(current_index + 1, 0, skins.size())
	update_display()


func _on_select_pressed() -> void:
	Globalskin.selected_skin_index = current_index


func _on_escape_button_pressed() -> void:
	get_tree().create_timer(0.3)
	to_tutorial_transition.change_scene(to_tutorial_transition.back)
