class_name LevelSelectMenu extends Control

var hoverfocus = preload("res://assets/Sprites/Button/green_pressed.png")
var greenregular = preload("res://assets/Sprites/Button/green.png")
var regular = preload("res://assets/Sprites/Button/blue.png")

@onready var level_0: TextureButton = $CanvasLayer/PageOne/Tutorial
@onready var level_1: TextureButton = $CanvasLayer/PageOne/LevelOne
@onready var level_2: TextureButton = $CanvasLayer/PageOne/LevelTwo
@onready var level_3: TextureButton = $CanvasLayer/PageOne/LevelThree
@onready var level_4: TextureButton = $CanvasLayer/PageTwo/LevelFour
@onready var level_5: TextureButton = $CanvasLayer/PageTwo/LevelFive

@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var page_one: ColorRect = $CanvasLayer/PageOne
@onready var page_two: ColorRect = $CanvasLayer/PageTwo

@onready var tutorial: TextureButton = $CanvasLayer/PageOne/Tutorial
@onready var level_one: TextureButton = $CanvasLayer/PageOne/LevelOne
@onready var level_four: TextureButton = $CanvasLayer/PageTwo/LevelFour

@onready var ui_select: AudioStreamPlayer = $CanvasLayer/UISelect

func _ready() -> void:
	page_two.hide()
	tutorial.grab_focus()
	
	#LEVEL TWO
	if Globallevel.completed_1 == true:
		level_2.disabled = false
	else:
		level_2.disabled = true
	#LEVEL THREE
	if Globallevel.completed_2 == true:
		level_3.disabled = false
	else:
		level_3.disabled = true
	#LEVEL FOUR
	if Globallevel.completed_3 == true:
		level_4.disabled = false
	else:
		level_4.disabled = true
	#LEVEL FIVE
	if Globallevel.completed_4 == true:
		level_5.disabled = false
	else:
		level_5.disabled = true



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

func _on_level_two_pressed() -> void:
	if Globallevel.completed_1 ==  false:
		level_2.disabled = true
		print("LEVEL ONE NOT COMPLETED")
	if Globallevel.completed_1 == true:
		level_2.disabled = false
		ui_select.play()
		get_tree().create_timer(0.3)
		to_tutorial_transition.change_scene(to_tutorial_transition.leveltwo)

func _on_level_three_pressed() -> void:
	if Globallevel.completed_2 ==  false:
		print("LEVEL TWO NOT COMPLETED")
	if Globallevel.completed_2 == true:
		ui_select.play()
		get_tree().create_timer(0.3)
		to_tutorial_transition.change_scene(to_tutorial_transition.levelthree)

func _on_level_four_pressed() -> void:
	if Globallevel.completed_3 ==  false:
		print("LEVEL THREE NOT COMPLETED")
	if Globallevel.completed_3 == true:
		ui_select.play()
		get_tree().create_timer(0.3)
		to_tutorial_transition.change_scene(to_tutorial_transition.levelfour)

func _on_level_five_pressed() -> void:
	if Globallevel.completed_4 ==  false:
		print("LEVEL FOUR NOT COMPLETED")
	if Globallevel.completed_4 == true:
		ui_select.play()
		to_tutorial_transition.change_scene(to_tutorial_transition.levelfive)





func _on_next_button_pressed() -> void:
	ui_select.play()
	page_two.show()
	level_four.grab_focus()

func _on_previous_button_pressed() -> void:
	ui_select.play()
	page_two.hide()
	tutorial.grab_focus()
