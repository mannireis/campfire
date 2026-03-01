class_name JumpState extends State

const jump_strength := -200

func enter() -> void:
	player.velocity.y = jump_strength

func process_physics(delta: float) -> State:
	if direction.x > 0:
		player.animator.flip_h = false
	if direction.x < 0:
		player.animator.flip_h = true
	player.velocity.x = direction.x * speed
	player.velocity.y += gravity * delta
	player.move_and_slide()
	
	if player.velocity.y > 0:
		return FallState.new()
	return
