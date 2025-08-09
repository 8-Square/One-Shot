class_name LevelCompletion 
extends CanvasLayer

const tutorial = ("res://assets/Scenes/Levels/Tutorial.tscn")
const levelone = ("res://assets/Scenes/Levels/LevelOne.tscn")
const leveltwo = ("res://assets/Scenes/Levels/LevelTwo.tscn")


@onready var finaltime : Label = $FinalTime
func _ready():
	pass

func display_final_time():
	var time_string = Stopwatch.time_to_string()
	finaltime.text = "Your Final Time Was:" + time_string

func level_complete(level_no):
	match level_no:
		"res://assets/Scenes/Levels/Tutorial.tscn":
			print("WORIJIFJOMNG")
			$AnimationPlayer.play("finish_level")
			%TComplete.show()
			
		"res://assets/Scenes/Levels/LevelOne.tscn":
			print("WORKING") 
			$AnimationPlayer.play("finish_level")
			await $AnimationPlayer.animation_finished
			$AnimationPlayer.seek($AnimationPlayer.current_animation_length, true)
			$AnimationPlayer.pause()
			%LOneComplete.show()
			finaltime.show()
			
		"res://assets/Scenes/Levels/LevelOne.tscn":
			print("LEVEL One WORKING")
			$AnimationPlayer.play("finish_level")
			await $AnimationPlayer.animation_finished
			$AnimationPlayer.seek($AnimationPlayer.current_animation_length, true)
			$AnimationPlayer.pause()
			%LOneComplete.show()
			finaltime.show()
			
		"res://assets/Scenes/Levels/LevelTwo.tscn":
			print("LEVEL TWO WORKING")
			$AnimationPlayer.play("finish_level")
			await $AnimationPlayer.animation_finished
			$AnimationPlayer.seek($AnimationPlayer.current_animation_length, true)
			$AnimationPlayer.pause()
			%LTwoComplete.show()
			finaltime.show()
			
