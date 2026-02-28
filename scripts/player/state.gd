class_name State extends Node

@export var animation_name: String
@export var speed: float = 300

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var player: Player
var direction: Vector2:
	get():
		return Vector2(Input.get_axis("left", "right"), 
		Input.get_axis("up", "down"))

func enter() -> void:
	player.animator.play(animation_name)

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null
