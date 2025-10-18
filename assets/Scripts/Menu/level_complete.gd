class_name LevelCompletion 
extends CanvasLayer

@onready var audiostreamplayer = $LevelCompleteAudio
@onready var fakeaudiostreamplayer = $DumbCompleteAudio

@onready var finaltime : Label = $FinalTime
func _ready():
	$LOneComplete.add_to_group("complete_label")
	$LThreeComplete.add_to_group("complete_label")
	$LTwoComplete.add_to_group("complete_label")
	$TComplete.add_to_group("complete_label")
	$LFourComplete.add_to_group("complete_label")
	$LFiveComplete.add_to_group("complete_label")
	$GameComplete.add_to_group("complete_label")

func hide_all_labels():
	for label in get_tree().get_nodes_in_group("complete_label"):
		if label is RichTextLabel:
			label.hide()


func display_final_time():
	var time_string = Stopwatch.time_to_string()
	finaltime.text = "Your Final Time Was:" + time_string

func level_complete(level_no):
	match level_no:
		"res://assets/Scenes/Levels/Tutorial.tscn":
			$AnimationPlayer.play("finish_level")
			await $AnimationPlayer.animation_finished
			$AnimationPlayer.seek($AnimationPlayer.current_animation_length, true)
			%TComplete.show()
			$HBoxContainer/RestartContainer/Restart.grab_focus()
			
		"res://assets/Scenes/Levels/LevelOne.tscn":
			print("LEVEL One WORKING")
			$AnimationPlayer.play("finish_level")
			await $AnimationPlayer.animation_finished
			$AnimationPlayer.seek($AnimationPlayer.current_animation_length, true)
			$AnimationPlayer.pause()
			%LOneComplete.show()
			$HBoxContainer/RestartContainer/Restart.grab_focus()
			finaltime.show()
			
		"res://assets/Scenes/Levels/LevelTwo.tscn":
			print("LEVEL TWO WORKING")
			$AnimationPlayer.play("finish_level")
			await $AnimationPlayer.animation_finished
			$AnimationPlayer.seek($AnimationPlayer.current_animation_length, true)
			$AnimationPlayer.pause()
			%LTwoComplete.show()
			$HBoxContainer/RestartContainer/Restart.grab_focus()
			finaltime.show()
			
		"res://assets/Scenes/Levels/LevelThree.tscn":
			$AnimationPlayer.play("finish_level")
			await $AnimationPlayer.animation_finished
			audiostreamplayer.play()
			$AnimationPlayer.seek($AnimationPlayer.current_animation_length, true)
			$AnimationPlayer.pause()
			%LThreeComplete.show()
			$HBoxContainer/RestartContainer/Restart.grab_focus()
			finaltime.show()
	#_on_next_level_pressed()
# MILKYWAY EXPANSION
		"res://assets/Scenes/Levels/LevelFour.tscn":
			$AnimationPlayer.play("finish_level")
			await $AnimationPlayer.animation_finished
			audiostreamplayer.play()
			$AnimationPlayer.seek($AnimationPlayer.current_animation_length, true)
			$AnimationPlayer.pause()
			%LFourComplete.show()
			$HBoxContainer/RestartContainer/Restart.grab_focus()
			finaltime.show()
		"res://assets/Scenes/Levels/LevelFive.tscn":
			$AnimationPlayer.play("finish_level")
			await $AnimationPlayer.animation_finished
			audiostreamplayer.play()
			$AnimationPlayer.seek($AnimationPlayer.current_animation_length, true)
			$AnimationPlayer.pause()
			%LFiveComplete.show()
			%GameComplete.show()
			$HBoxContainer/RestartContainer/Restart.grab_focus()
			$HBoxContainer/NextLevelContainer/NextLevel.hide()
			finaltime.show()
		"res://assets/Scenes/Levels/LevelFour.tscn_dumb":
			$AnimationPlayer.play("finish_level")
			await $AnimationPlayer.animation_finished
			fakeaudiostreamplayer.play()
			$AnimationPlayer.seek($AnimationPlayer.current_animation_length, true)
			$AnimationPlayer.pause()
			%DumbComplete.show()
			$HBoxContainer/RestartContainer/Restart.grab_focus()
			$HBoxContainer/NextLevelContainer/NextLevel.hide()
			finaltime.show()

func _on_next_level_pressed() -> void:
	hide_all_labels()
	$UISelect.play()
	match get_tree().current_scene.scene_file_path:
		"res://assets/Scenes/Levels/Tutorial.tscn":
			%AnimationPlayer.play_backwards("finish_level")
			to_tutorial_transition.change_scene(to_tutorial_transition.levelone)
		"res://assets/Scenes/Levels/LevelOne.tscn":
			%AnimationPlayer.play_backwards("finish_level")
			to_tutorial_transition.change_scene(to_tutorial_transition.leveltwo)
		"res://assets/Scenes/Levels/LevelTwo.tscn":
			%AnimationPlayer.play_backwards("finish_level")
			to_tutorial_transition.change_scene(to_tutorial_transition.levelthree)

# MILKYWAY EXPANSION
		"res://assets/Scenes/Levels/LevelThree.tscn":
			%AnimationPlayer.play_backwards("finish_level")
			to_tutorial_transition.change_scene(to_tutorial_transition.levelfour)
		"res://assets/Scenes/Levels/LevelFour.tscn":
			%AnimationPlayer.play_backwards("finish_level")
			to_tutorial_transition.change_scene(to_tutorial_transition.levelfive)
			
			

func _on_restart_pressed() -> void:
	$UISelect.play()
	get_tree().create_timer(0.1)
	%AnimationPlayer.play_backwards("finish_level")
	hide_all_labels()
	match get_tree().current_scene.scene_file_path:
		"res://assets/Scenes/Levels/Tutorial.tscn":
			to_tutorial_transition.change_scene(to_tutorial_transition.tutorial)
		"res://assets/Scenes/Levels/LevelOne.tscn":
			to_tutorial_transition.change_scene(to_tutorial_transition.levelone)
		"res://assets/Scenes/Levels/LevelTwo.tscn":
			to_tutorial_transition.change_scene(to_tutorial_transition.leveltwo)
		"res://assets/Scenes/Levels/LevelThree.tscn":
			to_tutorial_transition.change_scene(to_tutorial_transition.levelthree)
# MILKY WAY EXPANSION
		"res://assets/Scenes/Levels/LevelFour.tscn":
			to_tutorial_transition.change_scene(to_tutorial_transition.levelfour)
		"res://assets/Scenes/Levels/LevelFive.tscn":
			to_tutorial_transition.change_scene(to_tutorial_transition.levelfive)



func _on_quit_pressed() -> void:
	$UISelect.play()
	%AnimationPlayer.play_backwards("finish_level")
	hide_all_labels()
	get_tree().create_timer(0.2)
	to_tutorial_transition.change_scene(to_tutorial_transition.back)
