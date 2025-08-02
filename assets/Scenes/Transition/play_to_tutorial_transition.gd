extends CanvasLayer

const back = ("res://assets/Scenes/MainMenu.tscn")
const levelselect = ("res://assets/Scenes/LevelSelect.tscn")
const tutorial = ("res://assets/Scenes/Levels/Tutorial.tscn")
const levelone = ("res://assets/Scenes/Levels/LevelOne.tscn")

func change_scene(scene_path):
	match scene_path:
		back:
			%AnimationPlayer.play("fade_in")
			%MainMenuLabel.show()
			await %AnimationPlayer.animation_finished
			get_tree().change_scene_to_file("res://assets/Scenes/MainMenu.tscn")
			%AnimationPlayer.play("fade_out")
			await %AnimationPlayer.animation_finished 
			%LevelSelect.hide()
		levelselect:
			%AnimationPlayer.play("fade_in")
			%LevelSelect.show()
			await %AnimationPlayer.animation_finished
			get_tree().change_scene_to_file(levelselect)
			%AnimationPlayer.play("fade_out")
			await %AnimationPlayer.animation_finished 
			%LevelSelect.hide()
		tutorial:
			%AnimationPlayer.play("fade_in")
			%TutorialLable.show()
			await %AnimationPlayer.animation_finished
			get_tree().change_scene_to_file(tutorial)
			%AnimationPlayer.play("fade_out")
			await %AnimationPlayer.animation_finished 
			%TutorialLable.hide()
		levelone:
			%AnimationPlayer.play("fade_in")
			%LevelOneLabel.show()
			await %AnimationPlayer.animation_finished
			get_tree().change_scene_to_file(levelone)
			%AnimationPlayer.play("fade_out")
			await %AnimationPlayer.animation_finished 
			%LevelOneLabel.hide()
