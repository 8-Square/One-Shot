class_name HUD
extends Control

@export var stopwatch_label : Label
@onready var stopwatch = Stopwatch
func _ready():
	pass
		
func _process(delta):
	update_stopwatch_label()

func update_stopwatch_label():
	stopwatch_label.text = Stopwatch.time_to_string()
