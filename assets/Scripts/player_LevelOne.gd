extends CharacterBody2D

var SPEED = 400.0
const JUMP_VELOCITY = -700.0
var right_count = 0
var left_count = 0
var jump_count = 0

func _physics_process(delta: float) -> void:

	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_count += 1
		print("jump is equal to " + str(jump_count))

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		if Input.is_action_just_pressed("left"): 
			left_count += 1
			print("Left Count is " + str(left_count))
		elif Input.is_action_just_pressed("right"):
			right_count += 1
			print("Right Count is " + str(right_count))
		if is_on_wall():
			velocity.x *= -1
			velocity.x = SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, 0)

	else:
		velocity.x = move_toward(velocity.x, 0, 0)
	
	var collision_info = move_and_collide(velocity * delta, false, 0.3, true)

	if collision_info:
		var direction2 = velocity.bounce(collision_info.get_normal())
		if is_on_floor() or is_on_wall():
			velocity = direction2
		
	move_and_slide()

 
