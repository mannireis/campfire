class_name FallState extends State

func enter() -> void:
	player.animator.play("fall")
	player.hands.play("fall")


func process_physics(delta: float) -> State:
	if direction.x > 0:
		player.animator.flip_h = false
	if direction.x < 0:
		player.animator.flip_h = true
	player.velocity.y += gravity * delta
	player.velocity.x = speed * direction.x
	player.move_and_slide()
	
	if player.is_on_floor():
		return IdleState.new()
	return
