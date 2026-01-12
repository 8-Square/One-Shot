class_name LevelSelectMenu extends Control

@onready var tutorial: TextureButton = $CanvasLayer/CarouselContainer/Control/Tutorial
@onready var level_one: TextureButton = $CanvasLayer/CarouselContainer/Control/LevelOne
@onready var level_two: TextureButton = $CanvasLayer/CarouselContainer/Control/LevelTwo
@onready var level_three: TextureButton = $CanvasLayer/CarouselContainer/Control/LevelThree
@onready var level_four: TextureButton = $CanvasLayer/CarouselContainer/Control/LevelFour
@onready var level_five: TextureButton = $CanvasLayer/CarouselContainer/Control/LevelFive


@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var ui_select: AudioStreamPlayer = $CanvasLayer/UISelect

@export var LevelTabNodes: Array[TextureButton]

@export var LeftTabPos = Vector2(50, 45)
@export var CenterTabPos = Vector2(226, 32)
@export var RightTabPos = Vector2(500, 45)

var current_index = 0

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
	update_display()
	#tutorial.grab_focus()
	#
## GLOBAL COMPLETED LEVELS
	#
	##LEVEL TWO
	if Globallevel.completed_1 == true:
		level_two.disabled = false
	else:
		level_two.disabled = true
	##LEVEL THREE
	if Globallevel.completed_2 == true:
		level_three.disabled = false
	else:
		level_three.disabled = true
	##LEVEL FOUR
	if Globallevel.completed_3 == true:
		level_four.disabled = false
	else:
		level_four.disabled = true
	##LEVEL FIVE
	if Globallevel.completed_4 == true:
		level_five.disabled = false
	else:
		level_five.disabled = true
#

func _on_escape_button_pressed() -> void:
	ui_select.play()
	get_tree().create_timer(0.3)
	canvas_layer.hide()
	to_tutorial_transition.change_scene(to_tutorial_transition.back)

#func _on_tutorial_pressed() -> void:
	#ui_select.play()
	#get_tree().create_timer(0.3)
	#to_tutorial_transition.change_scene(to_tutorial_transition.tutorial)
#func _on_level_one_pressed() -> void:
	#ui_select.play()
	#get_tree().create_timer(0.3)
	#to_tutorial_transition.change_scene(to_tutorial_transition.levelone)
#func _on_level_two_pressed() -> void:
	#if Globallevel.completed_1 ==  false:
		#level_two.disabled = true
		#print("LEVEL ONE NOT COMPLETED")
	#if Globallevel.completed_1 == true:
		#level_2.disabled = false
		#ui_select.play()
		#get_tree().create_timer(0.3)
		#to_tutorial_transition.change_scene(to_tutorial_transition.leveltwo)
#func _on_level_three_pressed() -> void:
	#if Globallevel.completed_2 ==  false:
		#print("LEVEL TWO NOT COMPLETED")
	#if Globallevel.completed_2 == true:
		#ui_select.play()
		#get_tree().create_timer(0.3)
		#to_tutorial_transition.change_scene(to_tutorial_transition.levelthree)
#func _on_level_four_pressed() -> void:
	#if Globallevel.completed_3 ==  false:
		##print("LEVEL THREE NOT COMPLETED")
	##if Globallevel.completed_3 == true:
		##ui_select.play()
		##get_tree().create_timer(0.3)
		##to_tutorial_transition.change_scene(to_tutorial_transition.levelfour)
#func _on_level_five_pressed() -> void:
	#if Globallevel.completed_4 ==  false:
		###print("LEVEL FOUR NOT COMPLETED")
	###if Globallevel.completed_4 == true:
		###ui_select.play()
		###to_tutorial_transition.change_scene(to_tutorial_transition.levelfive)
##
##
###
###func _on_next_button_pressed() -> void:
	###ui_select.play()
	###page_two.show()
	###level_four.grab_focus()
###func _on_previous_button_pressed() -> void:
	###ui_select.play()
	###page_two.hide()
	###tutorial.grab_focus()
