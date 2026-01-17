# @tool
class_name CarouselContainer extends Control
# I don't really understand too much what I'm writing so im trying to comment to make it clearer for me

# Pixels between container children
@export var spacing: float = 20.0

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

@export var level_size: Array[TextureButton]

var target_scale: float
var center_y: float

func _ready() -> void:
	if Engine.is_editor_hint():
		return
	
func _process(delta: float) -> void:
	if !position_offset_node or position_offset_node.get_child_count() == 0:
		return
	
	
	for i in position_offset_node.get_children():
		var distance = i.get_index() - current_index
		#i.position.y = position_y + distance * (i.size.y + spacing)
		i.position.x = -i.size.x / 2.0
		i.position.y = distance * (i.size.y + spacing)
	
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
			# Gives focus to current index
			if !i.has_focus(): 
				i.grab_focus() 
				
		else:
			i.z_index = -abs(i.get_index()-current_index)
			i.mouse_filter = Control.MOUSE_FILTER_IGNORE
			i.focus_mode = Control.FOCUS_NONE
	
	# Smooth lerp movement
		# Lerp to current (selected) child
		#position_offset_node.position.y = lerp(position_offset_node.position.y, -(position_offset_node.get_child(current_index).position.y + position_offset_node.get_child(current_index).size.y/2.0), smoothing_speed*delta)
		#position_offset_node.position.y = lerp(position_offset_node.position.y, carousel_center_y -(position_offset_node.get_child(current_index).position.y + position_offset_node.get_child(current_index).size.y/2.0), smoothing_speed*delta)
	var child = position_offset_node.get_child(current_index)
	var child_center_y = child.position.y + child.size.y / 2.0
	position_offset_node.position.y = lerp(position_offset_node.position.y, carousel_center_y - child_center_y, min(smoothing_speed * delta, 1.0))

func _input(event: InputEvent) -> void:
	# Stops _Input from working when in editor (Fixes Crashing
	if Engine.is_editor_hint():
		return
	
	var max_index = position_offset_node.get_child_count()
	
	# SCROLL IN BOX
	if get_global_rect().has_point(get_global_mouse_position()):
		if event.is_action_pressed("scroll_down"):
			print("WAA")
			#current_index = wrapi(current_index + 1, 0, max_index)
			#get_viewport().set_input_as_handled()
			carousel_down()
		elif event.is_action_pressed("scroll_up"):
			print("WIII")
			#current_index = wrapi(current_index - 1, 0, max_index)
			#get_viewport().set_input_as_handled()
			carousel_up()
	# UP DOWN ARROWS
	if event.is_action_pressed("down"):
		print("GOING DOWN")
		carousel_down()
	elif event.is_action_pressed("jump"):
		print("GOING UP")
		carousel_up()
	
	var selected_button = position_offset_node.get_child(current_index)
	if event.is_action_pressed("continue"):
		if !selected_button.disabled:
			print("BUTTON NOT DISABLED")
			await get_tree().create_timer(0.3)
			selected_button.emit_signal("pressed")
		else:
			print("BUTTON DISABLED")

func carousel_down() -> void:
	current_index -= 1 
	if current_index < 0:
		current_index += 1

func carousel_up() -> void:
	current_index += 1 
	if current_index > position_offset_node.get_child_count()-1:
		current_index -= 1
