extends CanvasLayer

const back = ("res://assets/Scenes/Menu/MainMenu.tscn")
const levelselect = ("res://assets/Scenes/Menu/LevelSelect.tscn")
const tutorial = ("res://assets/Scenes/Levels/Tutorial.tscn")
const levelone = ("res://assets/Scenes/Levels/LevelOne.tscn")

func change_scene(scene_path):
	match scene_path:
		back:
			%AnimationPlayer.play("fade_in")
			%MainMenuLabel.show()
			await %AnimationPlayer.animation_finished
			get_tree().change_scene_to_file(back)
			%AnimationPlayer.play("fade_out")
			await %AnimationPlayer.animation_finished 
			%MainMenuLabel.hide()
		levelselect:
			%AnimationPlayer.play("fade_in", -1, 1.4)
			%LevelSelect.show()
			await %AnimationPlayer.animation_finished
			get_tree().change_scene_to_file(levelselect)
			%AnimationPlayer.play("fade_out", -1, 1)
			await %AnimationPlayer.animation_finished 
			%LevelSelect.hide()
		tutorial:
			%AnimationPlayer.play("fade_in")
			%TutorialLable.show()
			await %AnimationPlayer.animation_finished
			get_tree().change_scene_to_file(tutorial)
			Stopwatch.reset()
			%AnimationPlayer.play("fade_out")
			await %AnimationPlayer.animation_finished 
			%TutorialLable.hide()
		levelone:
			%AnimationPlayer.play("fade_in")
			%LevelOneLabel.show()
			await %AnimationPlayer.animation_finished
			get_tree().change_scene_to_file(levelone)
			Stopwatch.reset()
			%AnimationPlayer.play("fade_out")
			await %AnimationPlayer.animation_finished 
			%LevelOneLabel.hide()


			
