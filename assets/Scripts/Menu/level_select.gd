class_name LevelSelectMenu extends Control

@onready var tutorial: TextureButton = $CanvasLayer/CarouselContainer/Control/Tutorial
@onready var level_one: TextureButton = $CanvasLayer/CarouselContainer/Control/LevelOne
@onready var level_two: TextureButton = $CanvasLayer/CarouselContainer/Control/LevelTwo
@onready var level_three: TextureButton = $CanvasLayer/CarouselContainer/Control/LevelThree
@onready var level_four: TextureButton = $CanvasLayer/CarouselContainer/Control/LevelFour
@onready var level_five: TextureButton = $CanvasLayer/CarouselContainer/Control/LevelFive
@onready var level_six: TextureButton = $CanvasLayer/CarouselContainer/Control/LevelSix
@onready var level_seven: TextureButton = $CanvasLayer/CarouselContainer/Control/LevelSeven


@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var ui_select: AudioStreamPlayer = $CanvasLayer/UISelect

@export var LevelTabNodes: Array[TextureButton]

@export var LeftTabPos = Vector2(50, 45)
@export var CenterTabPos = Vector2(226, 32)
@export var RightTabPos = Vector2(500, 45)

var current_index = 0

# Save file, for level access
var save_pref: SaveManager

func update_display() -> void:
	for button in LevelTabNodes:
		button.visible = false
		
	
	var CenterLabel = LevelTabNodes[current_index]
	CenterLabel.position = CenterTabPos
	CenterLabel.scale = Vector2(2.3, 2.3)
	CenterLabel.visible = true
	
	# LEFT & RIGHT TAB
	var left_index = wrapi(current_index - 1, 0, LevelTabNodes.size())
	var right_index = wrapi(current_index + 1, 0, LevelTabNodes.size())	
	
	var left_skin = LevelTabNodes[left_index]
	left_skin.position = LeftTabPos
	left_skin.scale = Vector2(1.8, 1.8)
	left_skin.visible = true
	
	var RightLabel = LevelTabNodes[right_index]
	RightLabel.position = RightTabPos
	RightLabel.scale = Vector2(1.8, 1.8)
	RightLabel.visible = true

func _ready() -> void:
	# GLOBAL COMPLETED LEVELS
	save_pref = SaveManager.load_or_create()
	
	level_two.disabled = !save_pref.has_previous_level_completed(1)
	level_three.disabled = !save_pref.has_previous_level_completed(2)
	level_four.disabled = !save_pref.has_previous_level_completed(3)
	level_five.disabled = !save_pref.has_previous_level_completed(4)
	level_six.disabled = !save_pref.has_previous_level_completed(5)
	level_seven.disabled = !save_pref.has_previous_level_completed(6)

func _on_escape_button_pressed() -> void:
	ui_select.play()
	get_tree().create_timer(0.3)
	canvas_layer.hide()
	to_tutorial_transition.change_scene(to_tutorial_transition.back)


func _on_tutorial_pressed() -> void:
	ui_select.play()
	get_tree().create_timer(0.3)
	to_tutorial_transition.change_scene(to_tutorial_transition.tutorial)


func _on_level_one_pressed() -> void:
	ui_select.play()
	get_tree().create_timer(0.3)
	to_tutorial_transition.change_scene(to_tutorial_transition.levelone)
	print(save_pref.leaderboard_level_times.keys())


func _on_level_two_pressed() -> void:
	ui_select.play()
	get_tree().create_timer(0.3)
	to_tutorial_transition.change_scene(to_tutorial_transition.leveltwo)


func _on_level_three_pressed() -> void:
	ui_select.play()
	get_tree().create_timer(0.3)
	to_tutorial_transition.change_scene(to_tutorial_transition.levelthree)


func _on_level_four_pressed() -> void:
	ui_select.play()
	get_tree().create_timer(0.3)
	to_tutorial_transition.change_scene(to_tutorial_transition.levelfour)

func _on_level_five_pressed() -> void:
	ui_select.play()
	get_tree().create_timer(0.3)
	to_tutorial_transition.change_scene(to_tutorial_transition.levelfive)


func _on_level_six_pressed() -> void:
	ui_select.play()
	get_tree().create_timer(0.3)
	to_tutorial_transition.change_scene(to_tutorial_transition.levelsix)

func _on_level_seven_pressed() -> void:
	ui_select.play()
	get_tree().create_timer(0.3)
	to_tutorial_transition.change_scene(to_tutorial_transition.levelseven)
