class_name SettingsMenu extends Control

@onready var tab_container: TabContainer = $Settings/TabContainer
@onready var main = $"../../"
@onready var canvas_layer: CanvasLayer = $"../CanvasLayer"

func _ready() -> void:
	pass

func save():
	var current_tab = tab_container.current_tab
	var tab_node = tab_container.get_child(current_tab)
	if tab_node.has_method("save_settings"):
		tab_node.save_settings()
	else:
		print("SAVE SETTINGS OPTION NOT FOUND")

func exit():
	canvas_layer.show()
	self.hide()

func _on_confirm_exit_pressed() -> void:
	save()
	exit()

func _on_save_pressed() -> void:
	save()

func _on_cancel_pressed() -> void:
	exit()



func _on_previous_pressed() -> void:
	tab_container.select_previous_available()


func _on_next_pressed() -> void:
	tab_container.select_next_available()
