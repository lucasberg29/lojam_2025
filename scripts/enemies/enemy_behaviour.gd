extends Node

class_name EnemyBehaviour

var enemy_body:CharacterBody2D
var behaviour:Enums.Behaviour
var left_ray_cast:RayCast2D
var right_ray_cast:RayCast2D

var velocity: Vector2 = Vector2.ZERO

const ENEMY_SPEED := 100.0
const ACCELERATION := 600.0
var gravity_modifier = 1.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_flying = false
var current_direction = 0

func _init(_enemy_body:CharacterBody2D, _behaviour: Enums.Behaviour, 
_left_ray_cast: RayCast2D, _right_ray_cast:RayCast2D):
	enemy_body = _enemy_body
	behaviour = _behaviour
	left_ray_cast = _left_ray_cast
	right_ray_cast = _right_ray_cast
	current_direction = -1

func steer_enemy(delta:float):
	match behaviour:
		Enums.Behaviour.idle:
			Idle(delta)

		Enums.Behaviour.wandering_left:
			WanderLeft(delta)

		Enums.Behaviour.wandering_right:
			WanderRight(delta)

		Enums.Behaviour.attacking:
			Attack(delta)
			
		_:
			print("Unknown behaviour: %s" % str(behaviour))

func Idle(_delta:float) -> void:
	pass

func WanderLeft(delta:float) -> void:
	
	if not enemy_body.is_on_floor() and not is_flying:
		enemy_body.velocity.y += gravity * delta / gravity_modifier
	else:
		enemy_body.velocity.y = 0.0
	
	if left_ray_cast.is_colliding():
		current_direction = 1
	
	if right_ray_cast.is_colliding():
		current_direction = -1
	
	var target_speed = current_direction * ENEMY_SPEED
	enemy_body.velocity.x = move_toward(enemy_body.velocity.x, target_speed, ACCELERATION * delta)
	velocity = enemy_body.velocity
	
	enemy_body.move_and_slide()

func WanderRight(_delta:float) -> void:
	pass

func Attack(_delta:float) -> void:
	pass
