extends Node

# GLOBAL LEVEL
var completed_0 := false
var completed_1 := false
var completed_2 := false
var completed_3 := false
var completed_4 := false
var completed_5 := false


func is_completed(level_no: int): 
	match level_no:
		0:
			completed_0 = true
			print("LEVEL 0 COMPLETD")
		1:
			completed_1 = true
			print("LEVEL 1 COMPLETD")
		2:
			completed_2 = true
			print("LEVEL 2 COMPLETD")
		3:
			completed_3 = true
			print("LEVEL 3 COMPLETD")
		4:
			completed_4 = true
			print("LEVEL 4 COMPLETD")
		5:
			completed_5 = true
			print("LEVEL 5 COMPLETD")
