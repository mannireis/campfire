extends CharacterBody2D

@onready var animator := %AnimatedSprite2D
@onready var state_machine := %StateMachine

var direction: Vector2:
	get():
		return Vector2(Input.get_axis("left", "right"), 
		Input.get_axis("up", "down"))
