class_name SettingsMenu extends Control

@onready var tab_container: TabContainer = $Settings/TabContainer
@onready var main = $"../../"
@onready var canvas_layer: CanvasLayer = $"../CanvasLayer"

@export var SettingsTabNames: Array[Label]

var TabName_y = 45

var LeftTabPos = Vector2(50, TabName_y)
var CenterTabPos = Vector2(226, 32)
var RightTabPos = Vector2(500, TabName_y)


func _ready() -> void:
	update_display()

func update_display() -> void:
	var current_index := tab_container.current_tab
	
	for label in SettingsTabNames:
		label.visible = false
		
	
	var CenterLabel = SettingsTabNames[current_index]
	CenterLabel.position = CenterTabPos
	CenterLabel.scale = Vector2(1, 1)
	CenterLabel.visible = true
	
	# LEFT & RIGHT TAB
	var left_index = wrapi(current_index - 1, 0, SettingsTabNames.size())
	var right_index = wrapi(current_index + 1, 0, SettingsTabNames.size())	
	
	var left_skin = SettingsTabNames[left_index]
	left_skin.position = LeftTabPos
	left_skin.scale = Vector2(0.5, 0.5)
	left_skin.visible = true
	
	var RightLabel = SettingsTabNames[right_index]
	RightLabel.position = RightTabPos
	RightLabel.scale = Vector2(0.5, 0.5)
	RightLabel.visible = true


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

func tab_loop(new_index: int) -> void:
	var total_tabs = tab_container.get_tab_count()
	tab_container.current_tab = wrapi(new_index, 0, total_tabs)
func _on_previous_pressed() -> void:
	var current_index := tab_container.current_tab
	tab_loop(current_index - 1)
	update_display()
func _on_next_pressed() -> void:
	var current_index := tab_container.current_tab
	tab_loop(current_index + 1)
	update_display()
