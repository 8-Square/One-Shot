class_name LevelCompletedScreen extends CanvasLayer

@onready var audiostreamplayer = $LevelCompleteAudio
@onready var fakeaudiostreamplayer = $DumbCompleteAudio
@onready var finaltime : Label = $FinalTime

var level_number: int

var save_pref: SaveManager

func _ready():
	save_pref = SaveManager.load_or_create()


func hide_all_labels():
	for label in get_tree().get_nodes_in_group("complete_label"):
		if label is RichTextLabel:
			label.hide()

func show_all_containers():
	for container in get_tree().get_nodes_in_group("container"):
		if container is Container:
			container.show()

func display_final_time():
	var time_string = Stopwatch.time_to_string()
	finaltime.text = "Your Final Time Was:" + time_string

func level_complete(path, final_time: float):
	match path:
		"res://assets/Scenes/Levels/Tutorial.tscn":
			level_number = 0
			%TComplete.show()
			finish_animation(true, level_number, true)
			finish_level(level_number, final_time)
			
		"res://assets/Scenes/Levels/LevelOne.tscn":
			level_number = 1
			%LOneComplete.show()
			finish_animation(true, level_number, true)
			
		"res://assets/Scenes/Levels/LevelTwo.tscn":
			level_number = 2
			%LTwoComplete.show()
			finish_animation(true, level_number, true)
			
		"res://assets/Scenes/Levels/LevelThree.tscn":
			level_number = 3
			%LThreeComplete.show()
			finish_animation(true, level_number, true)
			
# MILKYWAY EXPANSION
		"res://assets/Scenes/Levels/LevelFour.tscn":
			level_number = 4
			%LFourComplete.show()
			finish_animation(true, level_number, true)
			
		"res://assets/Scenes/Levels/LevelFive.tscn":
			level_number = 5
			%LFiveComplete.show()
			finish_animation(true, level_number, true)


		"res://assets/Scenes/Levels/LevelFour.tscn_dumb":
			
			%DumbComplete.show()
			finish_animation(false, null, false)


func finish_animation(progress: bool, level_no, real_audio: bool):
	$AnimationPlayer.play("finish_level")
	
	# fake or real audio
	if real_audio == true:
		audiostreamplayer.play()
	else:
		fakeaudiostreamplayer.play()
	
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.seek($AnimationPlayer.current_animation_length, true)
	$AnimationPlayer.pause()
	
	# Show Boxes
	show_all_containers()
	$HBoxContainer/RestartContainer/Restart.grab_focus()
	
	# progress should almost always be true and is for normal levels 
	if progress == true:
		finaltime.show()
		save_pref.completing_level(level_no)
		
		# Specifically for final level (dont allow a next button)
		if level_no == 5:
			$HBoxContainer/NextLevelContainer.hide()
			%GameComplete.show()
		else: 
			pass
		
	else:
		# For Fake Level Four Ending
		$HBoxContainer/NextLevelContainer.hide()
	save_pref.save()

func finish_level(level_no, final_time: float):
	var final_score = final_time
	match level_no:
		"0":
			if final_score 
		"1":
			
		"2":
			
		"3":
			
		"4":
			


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
