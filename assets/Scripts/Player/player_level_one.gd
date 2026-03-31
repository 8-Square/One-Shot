class_name PlayerLevels extends BasePlayer
# Easy + Hard Mode Player

# Coyote time
const COYOTE_TIME: float = 0.15
var coyote_timer: float = 0.0

func _physics_process(delta: float) -> void:
	if hard_mode == true:
		hard_mode_process(delta)
	elif hard_mode == false:
		easy_mode_process(delta)

func hard_mode_process(delta: float) -> void:
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

func easy_mode_process(delta: float) -> void:
	if animated_sprite == null:
		return
	
	if not can_control:
		velocity = Vector2.ZERO
		move_and_slide()
		return
# JUMP
	if Input.is_action_just_pressed("jump") and coyote_timer > 0:
		velocity.y = JUMP_VELOCITY
		jumping = true
		$JumpAudio.play()
		coyote_timer = 0
	elif is_on_floor():
		jumping = false
		coyote_timer = COYOTE_TIME
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		coyote_timer -= delta
	
	
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
