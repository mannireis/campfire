class_name IdleState extends State

func process_input(event: InputEvent) -> State:
	if event.is_action_pressed("jump"):
		return JumpState.new()
	return


func process_physics(delta: float) -> State:
	if direction != 0:
		return WalkState.new()
	if player.velocity.y > 0:
		return FallState.new()
	return
