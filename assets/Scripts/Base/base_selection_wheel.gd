class_name BaseSelectWheel extends Control

#@export var nodetyp 
@export var TabNodes: Array[Node]

# Positioning of the "blocks"
@export var LeftTabPos = Vector2(50, 45)
@export var CenterTabPos = Vector2(226, 32)
@export var RightTabPos = Vector2(500, 45)

var current_index := 1

func update_display() -> void:
	
	for i in TabNodes:
		i.visible = false
		
	
	var CenterLabel = TabNodes[current_index]
	CenterLabel.position = CenterTabPos
	CenterLabel.scale = Vector2(1, 1)
	CenterLabel.visible = true
	
	# LEFT & RIGHT TAB
	var left_index = wrapi(current_index - 1, 0, TabNodes.size())
	var right_index = wrapi(current_index + 1, 0, TabNodes.size())	
	
	var left_skin = TabNodes[left_index]
	left_skin.position = LeftTabPos
	left_skin.scale = Vector2(0.5, 0.5)
	left_skin.visible = true
	
	var RightLabel = TabNodes[right_index]
	RightLabel.position = RightTabPos
	RightLabel.scale = Vector2(0.5, 0.5)
	RightLabel.visible = true
