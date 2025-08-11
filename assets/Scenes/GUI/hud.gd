class_name HUD
extends Control

@onready var level_complete_animation = $"/root/LevelComplete/AnimationPlayer"
@onready var level_complete = $"/root/LevelComplete/MarginContainer"

@export var stopwatch_label : Label
@onready var stopwatch = Stopwatch

var default_label : LabelSettings
var override_label : LabelSettings = null

func _ready():
	$StopwatchLabel.hide()
	default_label = stopwatch_label.label_settings
	
	override_label = LabelSettings.new()
	override_label.font = load("res://assets/Fonts/Coven-Filled.ttf")
	override_label.font_size  = 37

func _process(delta):
	update_stopwatch_label()
	if level_complete_animation.is_playing() or level_complete.visible: 
		$StopwatchLabel.hide()
		get_tree().create_timer(0.3)
		$StopwatchLabel.show()
		stopwatch_label.label_settings = override_label
		print("WORKJNG")
	else:
		stopwatch_label.label_settings = default_label

func update_stopwatch_label():
	stopwatch_label.text = Stopwatch.time_to_string()
	if Stopwatch.game_started and not $StopwatchLabel.visible:
		$StopwatchLabel.show()
