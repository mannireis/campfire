class_name Player extends CharacterBody2D

@onready var animator := %AnimatedSprite2D

@onready var state_machine := %StateMachine

func _ready() -> void:
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	print(state_machine.current_state.name)
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
