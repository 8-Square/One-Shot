extends Control

@onready var carousel_container: CarouselContainer = $"../CarouselContainer"
@onready var p_leader_board_1: RichTextLabel = $VBoxContainer/PLeaderBoard1
@onready var p_leader_board_2: RichTextLabel = $VBoxContainer/PLeaderBoard2
@onready var p_leader_board_3: RichTextLabel = $VBoxContainer/PLeaderBoard3


var save_pref: SaveManager


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	save_pref = SaveManager.load_or_create()
	carousel_container.index_changed.connect(on_index_changed)
	on_index_changed(carousel_container.current_index)

# Pretty much the same code form stopwatch.gd
func time_to_string(total_time: float) -> String:
	var msec = int(fmod(total_time, 1.0) * 1000)
	var sec = int(fmod(total_time, 60.0))
	var minute = int(total_time / 60)
	# FORMAT TIME
	var format_string = "%02d : %02d . %03d"
	var actual_string = format_string % [minute, sec, msec]
	#print(msec + sec + minute)
	return actual_string

func on_index_changed(index: int):
	var specific_button = carousel_container.position_offset_node.get_child(index)
	print(index)
	# Against tutorial, bc tutorial has no leaderboard
	if index == 0:
		p_leader_board_1.text = ""
		p_leader_board_2.text = ""
		p_leader_board_3.text = ""
		return
	# If level isnt unlocked yet
	if specific_button.disabled:
		p_leader_board_1.text = ""
		p_leader_board_2.text = ""
		p_leader_board_3.text = ""
	else:
		var scores = save_pref.leaderboard_level_times[index]
		#if save_pref.hard_mode == true:
			#p_leader_board_1.text = "1: " + (time_to_string(scores[0]) if scores[0] != 9999999 else "--") +  (" - (Hard)" if scores[0] != 9999999 else "") 
			#p_leader_board_2.text = "2: " + (time_to_string(scores[1]) if scores[1] != 9999999 else "--") +  (" - (Hard)" if scores[1] != 9999999 else "") 
			#p_leader_board_3.text = "3: " + (time_to_string(scores[2]) if scores[2] != 9999999 else "--") +  (" - (Hard)" if scores[2] != 9999999 else "") 
		#else:
		p_leader_board_1.text = "1: " + (time_to_string(scores[0]) if scores[0] != 9999999 else "--")
		p_leader_board_2.text = "2: " + (time_to_string(scores[1]) if scores[1] != 9999999 else "--")
		p_leader_board_3.text = "3: " + (time_to_string(scores[2]) if scores[2] != 9999999 else "--")
