class_name SkinSelection extends Control


@onready var label: Label = $Label
@onready var previousone: TextureButton = $CanvasLayer/Previous
@onready var container: Container = $Container
@onready var canvas_layer: CanvasLayer = $CanvasLayer

@export var skins: Array[AnimatedSprite2D]

var skin_y: int = -20

var far_left_pos := Vector2(-180, skin_y)
var left_pos := Vector2(-100, skin_y)
var center_pos := Vector2(0, skin_y)
var right_pos := Vector2(100, skin_y)
var far_right_pos := Vector2(180, skin_y)

var current_index: int = 0


func _ready() -> void:
	canvas_layer.show()
	container.show()
	previousone.grab_focus()
	update_display()

func update_display() -> void:
	for skin in skins:
		skin.visible = false
		skin.pause()
		skin.play("RESET")
	
	
	var center_skin = skins[current_index]
	center_skin.position = center_pos
	center_skin.scale = Vector2(4.3, 4.3)
	center_skin.visible = true
	center_skin.self_modulate = Color(1, 1, 1, 1)
	center_skin.play("default")
	
	# LEFT & RIGHT SKINS
	var left_index = wrapi(current_index + 1, 0, skins.size())
	var right_index = wrapi(current_index - 1, 0, skins.size())	
	
	
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
	
	# FAR LEFT & FAR RIGHT SKINS
	var far_left_index = wrapi(current_index + 2, 0, skins.size())
	var far_right_index = wrapi(current_index - 2, 0, skins.size())
	
	
	var far_right_skin = skins[far_right_index]
	far_right_skin.position = far_right_pos
	far_right_skin.scale = Vector2(3.0, 3.0)
	far_right_skin.visible = true
	far_right_skin.self_modulate = Color(0.3, 0.3, 0.3, 0.5)
	#far_right_skin.self_modulate = Color(1, 1, 1, 0.5)
	far_right_skin.pause()
	
	var far_left_skin = skins[far_left_index]
	far_left_skin.position = far_left_pos
	far_left_skin.scale = Vector2(3.0, 3.0)
	far_left_skin.visible = true
	far_left_skin.self_modulate = Color(0.3, 0.3, 0.3, 0.5)
	#far_left_skin.self_modulate = Color(1, 1, 1, 0.5)
	far_left_skin.pause()
	
	# NAMING LABEL
	var slime_name: String
	var slime = str(current_index)
	
	match slime:
		"0": slime_name = "Green"
		"1": slime_name = "Blue"
		"2": slime_name = "Red"
		"3": slime_name = "Brown"
		"4": slime_name = "Purple"
		"5": slime_name = "Dark"
		"6": slime_name = "Light"

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
	canvas_layer.hide()
	container.hide()
	to_tutorial_transition.change_scene(to_tutorial_transition.back)
