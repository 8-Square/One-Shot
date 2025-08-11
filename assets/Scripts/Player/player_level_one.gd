class_name PlayerLevels
extends BasePlayer

var tutorial = ("res://assets/Scenes/Levels/Tutorial.tscn")
var levelone = ("res://assets/Scenes/Levels/LevelOne.tscn")
var leveltwo = ("res://assets/Scenes/Levels/LevelTwo.tscn")

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
		print("JUMPED HAS BEEN USED " + str(jump_count))
	elif is_on_floor():
		jumping = false
	elif Input.is_action_just_pressed("jump") and jump_count >= max_jump_count:
		print("JUMP HAS BEEN USED, RESTART OR TRY WITHOUT")
	

	if not is_on_floor():
		velocity += get_gravity() * delta
	

	
# DIRECTIONAL MOVEMENT & ANIMATION LEFT RIGHT
	var direction := Input.get_axis("left", "right")
	if direction and Input.is_action_just_pressed("left"):
		velocity.x = direction * SPEED
# ANIMATION FLIP
		print("left HAS BEEN CLICKED " + str(left_count))
# RIGHT MOVEMENT
	elif direction and Input.is_action_just_pressed("right") and right_count < max_right_count:
		velocity.x = direction * SPEED
		right_count += 1
		print("RIGHT HAS BEEN CLICKED " + str(right_count))
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
		

	move_and_slide()
	
