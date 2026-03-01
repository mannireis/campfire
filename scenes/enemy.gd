extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var look_timer: Timer = $LookTimer
@onready var state_timer: Timer = $StateTimer
@onready var ray_cast_2d: RayCast2D = $RayCast2D

const SPEED = 50

enum EnemyState {WALKING, LOOKING}

var current_state : EnemyState
var direction : int

var current_health := 3

func _ready() -> void:
	animated_sprite_2d.play("idle")
	current_state = EnemyState.LOOKING
	direction = 1
	state_timer.wait_time = randi_range(2,3)
	state_timer.start()
	start_looking()


func start_looking():
	velocity.x = 0
	animated_sprite_2d.stop()
	
	look_timer.start()


func _physics_process(delta: float) -> void:
	if current_health == 0:
		queue_free()
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if not ray_cast_2d.is_colliding() and current_state == EnemyState.WALKING:
		change_look_direction()
	
	match current_state:
		EnemyState.WALKING: do_walk(delta)
	
	move_and_slide()

func do_walk(delta):
	velocity.x = SPEED * direction 
	
	animated_sprite_2d.play("idle")


func _on_state_timer_timeout() -> void:
	match current_state:
		EnemyState.WALKING:
			current_state = EnemyState.LOOKING
			start_looking()
		EnemyState.LOOKING:
			current_state = EnemyState.WALKING
			look_timer.stop()


func _on_look_timer_timeout() -> void:
	change_look_direction()


func change_look_direction():
	direction *= -1
	ray_cast_2d.position.x = direction * 3


func _on_damage_area_body_entered(body: Node2D) -> void:
	if body == Player:
		body.current_health -= 1


func _on_hit_area_area_entered(area: Area2D) -> void:
	_hit()

func _hit() -> void:
	animated_sprite_2d.play("hurt")
	current_health -= 1
	current_state = EnemyState.WALKING
