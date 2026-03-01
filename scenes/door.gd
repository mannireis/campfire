extends Node2D

var is_open := false

func _on_area_2d_body_entered(body: Player) -> void:
	if !is_open:
		$DoorOpen.play()
		$AnimatedSprite2D.speed_scale = 1
		$AnimatedSprite2D.play("open")
		is_open = true
		await $AnimatedSprite2D.animation_finished
		$StaticBody2D.collision_layer = 10


func _on_area_2d_body_exited(body: Player) -> void:
	await get_tree().create_timer(2)
	$DoorClose.play()
	$AnimatedSprite2D.speed_scale = -1
	$AnimatedSprite2D.play("open")
	$StaticBody2D.collision_layer = 10
	is_open = false
