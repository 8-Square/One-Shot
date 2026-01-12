extends CanvasLayer

const back = ("res://assets/Scenes/Menu/MainMenu.tscn")
const levelselect = ("res://assets/Scenes/Menu/LevelSelect.tscn")
const settings = ("res://assets/Scenes/Menu/Settings.tscn")
const credits = ("res://assets/Scenes/Menu/Credits.tscn")
const skins = ("res://assets/Scenes/Player/skin_selection.tscn")

const tutorial = ("res://assets/Scenes/Levels/Tutorial.tscn")
const levelone = ("res://assets/Scenes/Levels/LevelOne.tscn")
const leveltwo = ("res://assets/Scenes/Levels/LevelTwo.tscn")
const levelthree = ("res://assets/Scenes/Levels/LevelThree.tscn")
const levelfour = ("res://assets/Scenes/Levels/LevelFour.tscn")
const levelfive = ("res://assets/Scenes/Levels/LevelFive.tscn")

func _ready() -> void:
	%MainMenuLabel.add_to_group("labels")
	%SettingsLabel.add_to_group("labels")
	%CreditsLabel.add_to_group("labels")
	%SkinLabel.add_to_group("labels")
	%LevelSelect.add_to_group("labels")
	
	%TutorialLable.add_to_group("labels")
	%LevelOneLabel.add_to_group("labels")
	%LevelTwoLabel.add_to_group("labels")
	%LevelThreeLabel.add_to_group("labels")
	%LevelFourLabel.add_to_group("labels")
	%LevelFiveLabel.add_to_group("labels")


func hide_all_labels():
	for label in get_tree().get_nodes_in_group("labels"):
		if label is RichTextLabel:
			label.hide()
	
func change_scene_anim(new_scene, reload: bool, watch: bool, label: RichTextLabel):
	%AnimationPlayer.play("fade_in")
	label.show()
	await %AnimationPlayer.animation_finished
	%AnimationPlayer.play("RESET")
	get_tree().change_scene_to_file(new_scene)
	#%AnimationPlayer.play("fade_out")
	#await %AnimationPlayer.animation_finished 
	if reload == true:
		pass
	if watch == true:
		Stopwatch.reset()
		Stopwatch.stop()
	hide_all_labels()

func change_scene(scene_path):
	match scene_path:
		back:
			change_scene_anim(back, true, false, %MainMenuLabel)
		levelselect:
			change_scene_anim(levelselect, true, false, %LevelSelect)
		tutorial:
			change_scene_anim(tutorial, true, true, %TutorialLable)
		levelone:
			change_scene_anim(levelone, false, true, %LevelOneLabel)
		leveltwo:
			change_scene_anim(leveltwo, true, true, %LevelTwoLabel)
		levelthree:
			change_scene_anim(levelthree, true, true, %LevelThreeLabel)
		levelfour:
			change_scene_anim(levelfour, true, true, %LevelFourLabel)
		levelfive:
			change_scene_anim(levelfive, true, true, %LevelFiveLabel)
		
		settings:
			change_scene_anim(settings, false, false, %SettingsLabel)

		credits:
			change_scene_anim(credits, false, false, %CreditsLabel)

		skins:
			change_scene_anim(skins, false, false, %SkinLabel)
