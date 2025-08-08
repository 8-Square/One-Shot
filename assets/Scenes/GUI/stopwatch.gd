class_name Stop 
extends Node

var time = 0.0
var stopped = true
var game_started = false
func _process(delta):
	if stopped:
		return
	time += delta
	
func _input(event):
	if not game_started:
		if event.is_action("jump") or event.is_action("left") or event.is_action("right") or event.is_action("continue"):
			game_started = true
			start()

func reset():
	time = 0.0
	game_started = false

func start():
	stopped = false

func stop():
		stopped = true

func time_to_string() -> String:
	var total_time = time
	var msec = int(fmod(total_time, 1.0) * 1000)
	var sec = int(fmod(total_time, 60.0))
	var min = int(total_time / 60)	
	# FORMAT TIME
	var format_string = "%02d . %02d . %03d"
	var actual_string = format_string % [min, sec, msec]
	return actual_string
