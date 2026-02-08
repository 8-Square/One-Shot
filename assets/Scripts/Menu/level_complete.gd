class_name LevelCompletedScreen extends CanvasLayer

@onready var audiostreamplayer = $LevelCompleteAudio
@onready var fakeaudiostreamplayer = $DumbCompleteAudio
@onready var finaltime : Label = $FinalTime

var level_number: int
func _ready():
	$LOneComplete.add_to_group("complete_label")
	$LThreeComplete.add_to_group("complete_label")
	$LTwoComplete.add_to_group("complete_label")
	$TComplete.add_to_group("complete_label")
	$LFourComplete.add_to_group("complete_label")
	$LFiveComplete.add_to_group("complete_label")
	$DumbComplete.add_to_group("complete_label")
	$GameComplete.add_to_group("complete_label")
	$HBoxContainer/NextLevelContainer.add_to_group("containers")
	$HBoxContainer/RestartContainer.add_to_group("containers")
	$HBoxContainer/QuitContainer.add_to_group("containers")

func hide_all_labels():
	for label in get_tree().get_nodes_in_group("complete_label"):
		if label is RichTextLabel:
			label.hide()

func show_all_containers():
	for container in get_tree().get_nodes_in_group("containers"):
		if container is Container:
			container.show()

func display_final_time():
	var time_string = Stopwatch.time_to_string()
	finaltime.text = "Your Final Time Was:" + time_string

func level_complete(path):
	match path:
		"res://assets/Scenes/Levels/Tutorial.tscn":
			level_number = 0
			$AnimationPlayer.play("finish_level")
			await $AnimationPlayer.animation_finished
			$AnimationPlayer.seek($AnimationPlayer.current_animation_length, true)
			%TComplete.show()
			show_all_containers()
			$HBoxContainer/RestartContainer/Restart.grab_focus()
			Globallevel.is_completed(level_number)
		"res://assets/Scenes/Levels/LevelOne.tscn":
			level_number = 1
			print("LEVEL One WORKING")
			$AnimationPlayer.play("finish_level")
			await $AnimationPlayer.animation_finished
			$AnimationPlayer.seek($AnimationPlayer.current_animation_length, true)
			$AnimationPlayer.pause()
			%LOneComplete.show()
			show_all_containers()
			$HBoxContainer/RestartContainer/Restart.grab_focus()
			finaltime.show()
			Globallevel.is_completed(level_number)
		
		"res://assets/Scenes/Levels/LevelTwo.tscn":
			level_number = 2
			print("LEVEL TWO WORKING")
			$AnimationPlayer.play("finish_level")
			await $AnimationPlayer.animation_finished
			$AnimationPlayer.seek($AnimationPlayer.current_animation_length, true)
			$AnimationPlayer.pause()
			%LTwoComplete.show()
			show_all_containers()
			$HBoxContainer/RestartContainer/Restart.grab_focus()
			finaltime.show()
			Globallevel.is_completed(level_number)
		"res://assets/Scenes/Levels/LevelThree.tscn":
			level_number = 3
			$AnimationPlayer.play("finish_level")
			await $AnimationPlayer.animation_finished
			audiostreamplayer.play()
			$AnimationPlayer.seek($AnimationPlayer.current_animation_length, true)
			$AnimationPlayer.pause()
			%LThreeComplete.show()
			show_all_containers()
			$HBoxContainer/RestartContainer/Restart.grab_focus()
			finaltime.show()
			Globallevel.is_completed(level_number)
# MILKYWAY EXPANSION
		"res://assets/Scenes/Levels/LevelFour.tscn":
			level_number = 4
			$AnimationPlayer.play("finish_level")
			await $AnimationPlayer.animation_finished
			audiostreamplayer.play()
			$AnimationPlayer.seek($AnimationPlayer.current_animation_length, true)
			$AnimationPlayer.pause()
			show_all_containers()
			%LFourComplete.show()
			$HBoxContainer/RestartContainer/Restart.grab_focus()
			finaltime.show()
			Globallevel.is_completed(level_number)
		"res://assets/Scenes/Levels/LevelFive.tscn":
			level_number = 5
			$AnimationPlayer.play("finish_level")
			await $AnimationPlayer.animation_finished
			audiostreamplayer.play()
			$AnimationPlayer.seek($AnimationPlayer.current_animation_length, true)
			$AnimationPlayer.pause()
			%LFiveComplete.show()
			%GameComplete.show()
			show_all_containers()
			$HBoxContainer/RestartContainer/Restart.grab_focus()
			$HBoxContainer/NextLevelContainer.hide()
			finaltime.show()
			Globallevel.is_completed(level_number)

		"res://assets/Scenes/Levels/LevelFour.tscn_dumb":
			$AnimationPlayer.play("finish_level")
			await $AnimationPlayer.animation_finished
			fakeaudiostreamplayer.play()
			$AnimationPlayer.seek($AnimationPlayer.current_animation_length, true)
			$AnimationPlayer.pause()
			%DumbComplete.show()
			show_all_containers()
			$HBoxContainer/RestartContainer/Restart.grab_focus()
			$HBoxContainer/NextLevelContainer.hide()
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
