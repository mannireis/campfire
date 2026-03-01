class_name Player extends CharacterBody2D

@onready var animator := %AnimatedSprite2D
@onready var state_machine := %StateMachine
@onready var hands := %hands
@onready var steps: AudioStreamPlayer2D = $Steps

const MAX_HEALTH := 100

var current_health := 100
var wind_velocity: Vector2 = Vector2.ZERO

func _ready() -> void:
	use_battery()
	current_health = MAX_HEALTH
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)


func respawn() -> void:
	self.global_position = Vector2(-67.0, 5.0)


func _physics_process(delta: float) -> void:
	%TextureProgressBar.value = current_health
	printerr(state_machine.current_state.name)
	velocity += wind_velocity
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


func use_battery() -> void:
	$BatteryTimer.start()

func get_battery(quantity: int) -> void:
	quantity = quantity * 21
	%TextureProgressBar2.value += quantity

func _on_area_2d_body_entered(body: EnemyHitBox) -> void:
	current_health -= 20


func _on_battery_timer_timeout() -> void:
	%TextureProgressBar2.value -= 21
	use_battery()
