extends CharacterBody2D

var SPEED = 500.0
const JUMP_VELOCITY = -600.0
var left_count = 0
var jump_count = 0
var right_count = 0

func _physics_process(delta: float) -> void:

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
	
	move_and_slide()
