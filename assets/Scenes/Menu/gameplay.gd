class_name GamePlaySettings extends Control

@onready var button: Button = $VBoxContainer/HBoxContainer/Button

var button_pressed: bool = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if not button_pressed:
		button.text = "On"
		button_pressed = true
	else:
		button.text = "Off"
		button_pressed = false
