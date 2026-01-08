#enemy_baryonyx.gd
extends Enemy
class_name EnemyBaryonyx

var left_ray_cast:RayCast2D
var right_ray_cast:RayCast2D

func _init(_health: int, _damage: int, _body: CharacterBody2D, 
_enemy_animation: AnimationTree, _enemy_sprite:Sprite2D, 
_left_ray_cast:RayCast2D, _right_ray_cast:RayCast2D):
	enemy_type = Enums.EnemyType.baryonyx
	health = _health
	damage = _damage
	body = _body
	sprite = _enemy_sprite
	left_ray_cast = _left_ray_cast
	right_ray_cast = _right_ray_cast
	behaviour = EnemyBehaviour.new(body, Enums.Behaviour.wandering_left, left_ray_cast, right_ray_cast)
	behaviour.is_flying = false
	animation = EnemyAnimation.new(_enemy_animation, sprite)
	animation.start_animation("walk")
	is_alive = true

func update(delta: float):
	if is_alive:
		behaviour.steer_enemy(delta)
	else:
		body.velocity.x = body.velocity.x * 0.2
	animation.update_animation(behaviour)
	


func kill_enemy() -> void:
	is_alive = false
	print("Baryonyx roars as it dies!")

func move(direction: Vector2):
	print("Baryonyx stomps towards:", direction)

func resume_behaviour():
	animation.start_animation("walk")
