class_name SkinSelection extends Control


@onready var label: Label = $Label
@onready var previous: TextureButton = $CanvasLayer/Previous

@export var skins: Array[AnimatedSprite2D]


var left_pos := Vector2(-201, -61)
var center_pos := Vector2(-51, -61)
var right_pos := Vector2(99, -61)

var current_index: int = 0


func _ready() -> void:
	previous.grab_focus()
	update_display()

func update_display() -> void:
	for skin in skins:
		skin.visible = false
		skin.pause()
		skin.play("RESET")
	
	var left_index = wrapi(current_index + 1, 0, skins.size())
	var right_index = wrapi(current_index - 1, 0, skins.size())
	
	print(current_index)
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
	
	label.text = str(current_index)
	


func _on_previous_pressed() -> void:
	current_index = wrapi(current_index - 1, 0, skins.size())

	update_display()

func _on_next_pressed() -> void:
	current_index = wrapi(current_index + 1, 0, skins.size())
	update_display()
