class_name SettingsMenu extends Control

@onready var tab_container: TabContainer = $Settings/TabContainer
@onready var main = $"../../"
@onready var outside_canvas_layer: CanvasLayer = $"../CanvasLayer"
@onready var outside_background_music: AudioStreamPlayer = $"../BackgroundMusic"
@onready var background_music: AudioStreamPlayer = $AudioStreamPlayer
@onready var canvas_layer: CanvasLayer = $Settings

@export var SettingsTabNames: Array[Label]

var TabName_y = 45

var LeftTabPos = Vector2(130, TabName_y)
var CenterTabPos = Vector2(320, 32)
var RightTabPos = Vector2(600, TabName_y)


func _ready() -> void:
	background_music.stop()
	print("WORKING")
	update_display()

func initiate() -> void:
	outside_background_music.stop()
	background_music.play()
	self.show()
	canvas_layer.show()

func menu_hide() -> void:
	self.hide()
	canvas_layer.hide()


func update_display() -> void:
	var current_index := tab_container.current_tab
	
	for label in SettingsTabNames:
		label.visible = false
		
	# Defining the center label and its position, scale and area
	var CenterLabel = SettingsTabNames[current_index]
	CenterLabel.position = CenterTabPos
	CenterLabel.scale = Vector2(1, 1)
	CenterLabel.visible = true
	# Centering the label
	CenterLabel.position.x = CenterTabPos.x - CenterLabel.size.x / 2.0
	
	# LEFT & RIGHT TAB
	var left_index = wrapi(current_index - 1, 0, SettingsTabNames.size())
	var right_index = wrapi(current_index + 1, 0, SettingsTabNames.size())	
	
	# Defining the left label and its position, scale and area
	var LeftLabel = SettingsTabNames[left_index]
	LeftLabel.position = LeftTabPos
	LeftLabel.scale = Vector2(0.5, 0.5)
	LeftLabel.visible = true
	
	LeftLabel.position.x = LeftTabPos.x - LeftLabel.size.x / 2.0
	
	# Defining the right label and its position, scale and area
	var RightLabel = SettingsTabNames[right_index]
	RightLabel.position = RightTabPos
	RightLabel.scale = Vector2(0.5, 0.5)
	RightLabel.visible = true
	# Centering the right label
	RightLabel.position.x = RightTabPos.x - RightLabel.size.x / 2.0


func save():
	var current_tab = tab_container.current_tab
	var tab_node = tab_container.get_child(current_tab)
	if tab_node.has_method("save_settings"):
		tab_node.save_settings()
	else:
		print("SAVE SETTINGS OPTION NOT FOUND")
func exit():
	background_music.stop()
	outside_canvas_layer.show()
	outside_background_music.play()
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


func _on_check_button_pressed() -> void:
	pass # Replace with function body.
