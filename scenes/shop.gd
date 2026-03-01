extends Node2D

@export var quantity := 3

func _on_area_2d_body_entered(body: Player) -> void:
	body.get_battery(quantity)
