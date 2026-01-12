class_name GamePlaySettings extends Control
#
#@onready var button: Button = $VBoxContainer/HBoxContainer/Button
#@onready var check_button: CheckButton = $VBoxContainer/HBoxContainer/CheckButton
#
#var turned_on: bool = false
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
#
#
#
#func _on_check_button_pressed() -> void:
	#if not turned_on:
		#check_button.text = "On"
		#turned_on = true
	#else:
		#check_button.text = "Off"
		#turned_on = false
