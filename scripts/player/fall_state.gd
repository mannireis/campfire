class_name FallState extends State

func process_physics(delta: float) -> State:
	player.velocity.y += gravity * delta
	player.velocity.x = speed * direction.x
	player.move_and_slide()
	
	if player.is_on_floor():
		return IdleState.new()
	return
