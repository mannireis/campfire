class_name Player extends CharacterBody2D

@onready var animator := %AnimatedSprite2D
@onready var state_machine := %StateMachine
@onready var hands := %hands

func _ready() -> void:
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:

	print(state_machine.current_state.name)
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
	var joypads = Input.get_connected_joypads()
	var using_controller := false

	if not joypads.is_empty():
		var device_id = joypads[0]

		var aim_input = Vector2(
			Input.get_joy_axis(device_id, JOY_AXIS_RIGHT_X),
			Input.get_joy_axis(device_id, JOY_AXIS_RIGHT_Y)
		)

		if aim_input.length() > 0.2:
			$PointLight2D2.rotation = aim_input.angle()
			using_controller = true

	if not using_controller:
		var dir = (get_global_mouse_position() - global_position)
		$PointLight2D2.rotation = dir.angle()
