extends CharacterBody2D


var SPEED = 500.0
const JUMP_VELOCITY = -600.0


func _physics_process(delta: float) -> void:
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
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
		print(velocity)
		
	move_and_slide()
