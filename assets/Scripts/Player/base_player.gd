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
var bouncing = false
var jumping = false
var play_count : int = 0 

var bounce_timer = 0.0
const bounce_animation_time = 0.3

func _init() -> void:
	pass
func _physics_process(delta: float) -> void:
	if not can_control:
		velocity = Vector2.ZERO
		move_and_slide()
		return
# JUMP
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jumping = true
		$JumpAudio.play()
	elif is_on_floor():
		jumping = false
	

	if not is_on_floor():
		velocity += get_gravity() * delta
	

	
# DIRECTIONAL MOVEMENT & ANIMATION LEFT RIGHT
	var direction := Input.get_axis("left", "right")
	if direction and Input.is_action_just_pressed("left"):
		velocity.x = direction * SPEED
# RIGHT MOVEMENT
	elif direction and Input.is_action_just_pressed("right"):
		velocity.x = direction * SPEED
		right_count += 1
	# IMPLEMENT THE LEFT RIGHT COUNTS 
	elif is_on_wall(): 
		velocity.x *= -1
		velocity.x = SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 0)
	
	
# COLLISIONN
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		var direction2 = velocity.bounce(collision_info.get_normal())
		var normal = collision_info.get_normal()
		if abs(normal.x) > 0.7 and abs(normal.y) < 0.3:
			velocity = direction2
			bouncing = true
			bounce_timer = bounce_animation_time
			animated_sprite.flip_h = velocity.x > 0
			animated_sprite.play("bounce", true)
		#if is_on_wall():
			#velocity = direction2
			#bouncing = true
	if bouncing:
		bounce_timer -= delta
		if bounce_timer <= 0.0:
			bouncing = false
			animated_sprite.stop()
# ANIMATION TYPE SHI
	if not bouncing:
		if is_on_floor():
			if velocity.x != 0:
				animated_sprite.play("moving")
				animated_sprite.flip_h = velocity.x < 0
			else:
				get_tree().create_timer(0.4)
				animated_sprite.play("default")
		elif jumping:
			if velocity.y < 0:
				animated_sprite.play("jump")
			else:
				animated_sprite.play("fall")
		else:
			animated_sprite.play("fall")
	
	
	if Input.is_action_just_pressed("down") and is_on_floor():
		position.y += 1
		
	if Input.is_action_just_pressed("restart"):
		fast_reset()
		
	move_and_slide()

func fast_reset() -> void:
	visible = false
	can_control = false
	Stopwatch.stop()
	velocity = Vector2.ZERO
	await get_tree().create_timer(0.2).timeout
	reset_player()

func handle_danger() -> void:
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
