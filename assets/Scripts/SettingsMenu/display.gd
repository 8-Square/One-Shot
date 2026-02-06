class_name DisplaySettings extends Control

# Btw, for anyone reading these comments, these are mainly for me for when 
# I'll come back to the code later
# jut to figure out that I have no idea what the code actually does..


@onready var fps_slider: HSlider = $VBoxContainer/FPSBox/FPSSlider
@onready var fps_text: Label = $VBoxContainer/FPSBox/FPSText
@onready var fps_label: Label = $VBoxContainer/FPSBox/FPSLabel

@onready var vsync_text: Label = $VBoxContainer/VSyncBox/VSyncText
var vsync_toggle: bool 
func _ready() -> void:
	Engine.max_fps = 0
	_on_v_sync_button_toggled(true)

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	fps_label.text = str(Engine.get_frames_per_second())
	fps_preview()

func fps_preview() -> void:
	# Cheks fps and decides whther to call it unlimited or not
	if fps_slider.value < 155.0:
		fps_text.text = str(fps_slider.value) 
	elif fps_slider.value > 155.0:
		fps_text.text = "Unlimited"
	# random "failsafe" to stop if somethings gone wrong..
	else:
		print("Somethings gone incredibly wrong")
		return

# VSync Toggle
func _on_v_sync_button_toggled(enabled: bool) -> void:
	vsync_text.text = "On" if enabled else "Off"
	vsync_toggle = true if enabled else false

	## If toggled on, enable VSync
	#if enabled:
		#vsync_text.text = "On"
		#enabled = true
		#DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	## If toggled off
	#elif not enabled:
		#vsync_text.text = "Off"
		#enabled = false
		#DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
	

@warning_ignore("unused_parameter")
func _on_resolution_options_item_selected(index: int) -> void:
	pass # Replace with function body.


func save_settings(): 
	# Checks for fps value. 
	# if below 365 then it = to slider ||| if above 365 (unlimited), don't cap fps 
	if fps_slider.value < 155.0:
		@warning_ignore("narrowing_conversion")
		Engine.max_fps = fps_slider.value
	else: 
		Engine.max_fps = 0
	print("Display Settings Successfully Saved")
	print(str(vsync_toggle))
	# Sets VSync mode
	var vsync_mode = DisplayServer.VSYNC_ENABLED if vsync_toggle == true else DisplayServer.VSYNC_DISABLED
	DisplayServer.window_set_vsync_mode(vsync_mode)
