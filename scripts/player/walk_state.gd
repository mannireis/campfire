class_name WalkState extends State

func process_physics(delta: float) -> State:
	player.velocity.x = direction.x * speed
	player.velocity.y += gravity * delta
	player.move_and_slide()

	if !player.is_on_floor():
		return FallState.new()
	elif Input.is_action_just_pressed("jump"):
		return JumpState.new()
	elif is_equal_approx(direction.x, 0.0):
		return IdleState.new()
	return
