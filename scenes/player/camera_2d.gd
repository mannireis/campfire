extends Camera2D

func _process(delta: float) -> void:
	position = lerp(position, $"../player".global_position, 1 * delta)
