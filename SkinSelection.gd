class_name SkinSelection extends Control


@onready var label: Label = $Label

@export var skins: Array[AnimatedSprite2D]

var current_index: int = 0

func _ready() -> void:
	update_display()

func update_display() -> void:
	for skin in skins:
		skin.visible = false
		
	skins[current_index].visible = true
	skins[current_index].play("idle")
	label.text = str(current_index)



func _on_previous_pressed() -> void:
	current_index = wrapi(current_index + 1, 0, skins.size())


func _on_next_pressed() -> void:
	current_index = wrapi(current_index + 1, 0, skins.size())
