@tool class_name CarouselContainer extends Control
# I don't really understand too much what I'm writing so im trying to comment to make it clearer for me

# Pixels between container children
@export var spacing: float = 20.0

# 3D wrap around effect
@export var wraparound_enabled: bool = false
# horizontal spacing between container children
@export var wraparound_radius: float = 300.0
# Height of children behind selected child
@export var wraparound_height: float = 50.0

# How quick options fade out
@export_range(0.0, 1.0) var opacity_strength: float = 0.35
# How quickly children scale down
@export_range(0.0, 1.0) var scale_strength: float = 0.25
# Minimum size children can scale to
@export_range(0.0, 0.99 ,1.0) var scale_min: float = 1

# How fast the change occurs during the animation
@export var smoothing_speed: float = 6.5
@export var current_index: int = 0
# Change focus to button 
@export var follow_button_focus: bool = false

# Center of carousel
@export var carousel_center_y: float = 0
# Target
@export var position_offset_node: Control = null

var target_scale: float
var center_y: float

func _process(delta: float) -> void:
	if !position_offset_node or position_offset_node.get_child_count() == 0:
		return
	
	current_index = clamp(current_index, 0, position_offset_node.get_child_count()-1)
	
	var cumulative_y = 0
	for i in position_offset_node.get_children():
		if wraparound_enabled:
			pass
		else:
			var position_y = 0
			var distance = i.get_index() - current_index
			#i.position.y = position_y + distance * (i.size.y + spacing)
			i.position.x = -i.size.x / 2.0
			i.position.y = cumulative_y
			cumulative_y += i.size.y + spacing
	
	# Scale Movement
		#Scaling Origin
		i.pivot_offset.x = 441
		# Target Scale
		if i.get_index() == current_index:
			target_scale = 1.5
		else:
			target_scale = 1.5 - (scale_strength * abs(i.get_index()-current_index))
		target_scale = clamp(target_scale, scale_min, 1.5)
		i.scale = lerp(i.scale, Vector2.ONE * target_scale, smoothing_speed*delta)
		
	# Opacity for nodes
		var target_opacity = 1.0 - (opacity_strength * abs(i.get_index()-current_index))
		target_opacity = clamp(target_opacity, 0.0, 1.0)
		i.modulate.a = lerp(i.modulate.a, target_opacity, smoothing_speed*delta)
		
	# Z index, Children infront or behind
		if i.get_index() == current_index:
			i.z_index = 1
			i.mouse_filter = Control.MOUSE_FILTER_STOP
			i.focus_mode = Control.FOCUS_ALL
		else:
			i.z_index = -abs(i.get_index()-current_index)
			i.mouse_filter = Control.MOUSE_FILTER_IGNORE
			i.focus_mode = Control.FOCUS_NONE
	# Give current index focus
		if follow_button_focus and i.has_focus():
			current_index = i.get_index()
	
	# Smooth lerp movement
	if wraparound_enabled:
		# Lerp to middle
		position_offset_node.position.y = lerp(position_offset_node.position.y, 0.0, smoothing_speed*delta)
	else:
		# Lerp to current (selected) child
		#position_offset_node.position.y = lerp(position_offset_node.position.y, -(position_offset_node.get_child(current_index).position.y + position_offset_node.get_child(current_index).size.y/2.0), smoothing_speed*delta)
		#position_offset_node.position.y = lerp(position_offset_node.position.y, carousel_center_y -(position_offset_node.get_child(current_index).position.y + position_offset_node.get_child(current_index).size.y/2.0), smoothing_speed*delta)
		var child = position_offset_node.get_child(current_index)
		var child_center_y = child.position.y + child.size.y / 2.0
		position_offset_node.position.y = lerp(position_offset_node.position.y, carousel_center_y - child_center_y, min(smoothing_speed * delta, 1.0))
