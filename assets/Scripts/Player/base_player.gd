class_name BasePlayer
extends CharacterBody2D

@export var level_start_pos : Node2D

@export var SPEED = 500.0
@export var JUMP_VELOCITY = -600.0
@export var max_jump_count = 100
@export var max_right_count = 100
@export var max_left_count = 100

@onready var animated_sprite = %AnimatedSprite2D
var left_count = 0
var jump_count = 0
var right_count = 0
var can_control : bool = true

var play_count : int = 0 

func _init() -> void:
	pass

func _physics_process(delta: float) -> void:
	if not can_control: 
		velocity = Vector2.ZERO
		move_and_slide()
		return
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_count += 1
		print("JUMPED HAS BEEN USED " + str(jump_count))
	elif Input.is_action_just_pressed("jump"):
		print("JUMP HAS BEEN USED, RESTART OR TRY WITHOUT")
		
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	var direction := Input.get_axis("left", "right")
	if direction and Input.is_action_just_pressed("left"):
		velocity.x = direction * SPEED
		left_count += 1
		print("left HAS BEEN CLICKED " + str(left_count))
	elif direction and Input.is_action_just_pressed("right"):
		velocity.x = direction * SPEED
		right_count += 1
		print("RIGHT HAS BEEN CLICKED " + str(right_count))
	# IMPLEMENT THE LEFT RIGHT COUNTS 
	elif is_on_wall(): 
		velocity.x *= -1
		velocity.x = SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 0)
		
	var collision_info = move_and_collide(velocity * delta, false, 0.3, false)

	if collision_info:
		var direction2 = velocity.bounce(collision_info.get_normal())
		if is_on_floor() or is_on_wall():
			velocity = direction2
		
	#if (Input.is_action_just_pressed("left") and left_count < 5) || (Input.is_action_just_pressed("left") and left_count < 5):
		#left_count += 1
	if Input.is_action_just_pressed("down") and is_on_floor():
		set_collision_mask_value(5, false)
		await get_tree().create_timer(0.2)
		set_collision_layer_value(5, true)
## VELOCITY FRR 
	if velocity.x != 0:
		animated_sprite.play("moving")
		if direction < 0:
			animated_sprite.flip_h = true
		elif direction > 0:
			animated_sprite.flip_h = false
	else:
		await get_tree().create_timer(0.5)
		animated_sprite.play("default")
	
	move_and_slide()


func handle_danger() -> void:
	print("Player Died!")
	visible = false
	can_control = false
	Stopwatch.stop()
	velocity = Vector2.ZERO
	await get_tree().create_timer(0.6).timeout
	reset_player()
	
func reset_player() -> void:
	global_position = level_start_pos.global_position
	visible = true
	can_control = true
	Stopwatch.reset()
	animated_sprite.play("default")
