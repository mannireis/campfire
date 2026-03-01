class_name IdleState extends State

func enter() -> void:
	player.animator.play("idle")
	player.hands.play("idle")


func process_input(event: InputEvent) -> State:
	if event.is_action_pressed("jump"):
		return JumpState.new()
	return


func process_physics(delta: float) -> State:
	if direction.x > 0:
		player.animator.flip_h = false
	if direction.x < 0:
		player.animator.flip_h = true
	player.velocity.x = move_toward(player.velocity.x, 0, 8)
	player.velocity.y += gravity * delta
	player.move_and_slide()
	if direction.x != 0:
		return WalkState.new()
	if !player.is_on_floor():
		return FallState.new()
	return
