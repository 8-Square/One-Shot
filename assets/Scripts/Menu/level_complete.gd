extends CanvasLayer

const tutorial = ("res://assets/Scenes/Levels/Tutorial.tscn")
const levelone = ("res://assets/Scenes/Levels/LevelOne.tscn")

func level_complete(level_no):
	match level_no:
		tutorial: 
			%AnimationPlayer.play("finish_tutorial")
			
