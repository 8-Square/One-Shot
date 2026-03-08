extends Control

@onready var carousel_container: CarouselContainer = $"../CarouselContainer"
@export var panels: Array[Panel]

func _ready() -> void:
	carousel_container.index_changed.connect(on_index_changed)
	on_index_changed(carousel_container.current_index)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_index_changed(index: int):
	# Visibility
	for i in panels.size():
		panels[i].visible = (i == index)
	
	var buttons = carousel_container.position_offset_node.get_child(index)
	if buttons.disabled:
		panels[index].modulate = Color(0.2, 0.3, 0.5)
	else:
		panels[index].modulate = Color.WHITE
