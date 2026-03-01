class_name WalkState extends State

func enter() -> void:
	player.steps.play()
	player.animator.play("walk")
	player.hands.play("walk")


func process_physics(delta: float) -> State:
	player.steps.play()
	player.velocity.x = direction.x * speed
	player.velocity.y += gravity * delta
	if direction.x > 0:
		player.animator.flip_h = false
	if direction.x < 0:
		player.animator.flip_h = true
	player.move_and_slide()
	
	
	if !player.is_on_floor():
		return FallState.new()
	elif Input.is_action_just_pressed("jump"):
		return JumpState.new()
	elif is_equal_approx(direction.x, 0.0):
		return IdleState.new()
	return
