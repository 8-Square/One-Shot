class_name LevelCompletion 
extends CanvasLayer

const tutorial = ("res://assets/Scenes/Levels/Tutorial.tscn")
const levelone = ("res://assets/Scenes/Levels/LevelOne.tscn")
const leveltwo = ("res://assets/Scenes/Levels/LevelTwo.tscn")
const levelthree = ("res://assets/Scenes/Levels/LevelThree.tscn")

@onready var audiostreamplayer = $LevelCompleteAudio

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
			await $AnimationPlayer.animation_finished
			$AnimationPlayer.seek($AnimationPlayer.current_animation_length, true)
			%TComplete.show()
			%MarginContainer.show()
			$MarginContainer/HBoxContainer/Restart.grab_focus()
			
		"res://assets/Scenes/Levels/LevelOne.tscn":
			print("WORKING") 
			$AnimationPlayer.play("finish_level")
			await $AnimationPlayer.animation_finished
			$AnimationPlayer.seek($AnimationPlayer.current_animation_length, true)
			$AnimationPlayer.pause()
			%LOneComplete.show()
			%MarginContainer.show()
			$MarginContainer/HBoxContainer/Restart.grab_focus()
			finaltime.show()
			
		"res://assets/Scenes/Levels/LevelOne.tscn":
			print("LEVEL One WORKING")
			$AnimationPlayer.play("finish_level")
			await $AnimationPlayer.animation_finished
			audiostreamplayer.play()
			$AudioStreamPlayer2D.playing
			audiostreamplayer.play()
			$AnimationPlayer.seek($AnimationPlayer.current_animation_length, true)
			$AnimationPlayer.pause()
			%LOneComplete.show()
			%MarginContainer.show()
			$MarginContainer/HBoxContainer/TextureButton.grab_focus()
			finaltime.show()
			
		"res://assets/Scenes/Levels/LevelTwo.tscn":
			print("LEVEL TWO WORKING")
			$AnimationPlayer.play("finish_level")
			await $AnimationPlayer.animation_finished
			$AnimationPlayer.seek($AnimationPlayer.current_animation_length, true)
			$AnimationPlayer.pause()
			%LTwoComplete.show()
			%MarginContainer.show()
			$MarginContainer/HBoxContainer/TextureButton.grab_focus()
			finaltime.show()
			
		"res://assets/Scenes/Levels/LevelThree.tscn":
			$AnimationPlayer.play("finish_level")
			await $AnimationPlayer.animation_finished
			audiostreamplayer.play()
			$AnimationPlayer.seek($AnimationPlayer.current_animation_length, true)
			$AnimationPlayer.pause()
			%LThreeComplete.show()
			%MarginContainer.show()
			$MarginContainer/HBoxContainer/TextureButton.grab_focus()
			finaltime.show()
	#_on_next_level_pressed()



func _on_next_level_pressed() -> void:
	match get_tree().current_scene:
		"res://assets/Scenes/Levels/Tutorial.tscn":
			get_tree().create_timer(0.3)
			hide()
			to_tutorial_transition.change_scene(to_tutorial_transition.levelone)
		"res://assets/Scenes/Levels/LevelOne.tscn":
			get_tree().create_timer(0.3)
			hide()
			to_tutorial_transition.change_scene(to_tutorial_transition.leveltwo)
		"res://assets/Scenes/Levels/LevelTwo.tscn":
			get_tree().create_timer(0.3)
			hide()
			to_tutorial_transition.change_scene(to_tutorial_transition.levelthree)


func _on_restart_pressed() -> void:
	hide()
	get_tree().reload_current_scene()

func _on_quit_pressed() -> void:
	hide()
	get_tree().create_timer(0.2)
	to_tutorial_transition.change_scene(to_tutorial_transition.back)
