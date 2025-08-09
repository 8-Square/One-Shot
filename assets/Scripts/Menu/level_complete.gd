class_name LevelCompletion 
extends CanvasLayer

const tutorial = ("res://assets/Scenes/Levels/Tutorial.tscn")
const levelone = ("res://assets/Scenes/Levels/LevelOne.tscn")
@onready var finaltime = ("FinalTime")
@onready var anim = ("AnimationPlayer")

func _ready() -> void:
	anim
	finaltime

func display_final_time():
	var time_string = Stopwatch.time_to_string()
	finaltime.text = "Your Final Time Was:" + time_string

func level_complete(level_no):
	match level_no:
		"res://assets/Scenes/Levels/LevelOne.tscn":
			show()
			anim.play("finish_level")
		"res://assets/Scenes/Levels/Tutorial.tscn": 
			show()
			anim.play("finish_level")
			await anim.animation_finished
			get_tree().create_timer(0.5)
			%LOneComplete.show()
			finaltime.show()

			
