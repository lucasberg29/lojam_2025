#enemy_baryonyx.gd
extends Enemy
class_name EnemyAlanqa

var left_ray_cast:RayCast2D
var right_ray_cast:RayCast2D

func _init(_health: int, _damage: int, _body: CharacterBody2D, 
_enemy_animation: AnimationTree, _enemy_sprite:Sprite2D, 
_left_ray_cast:RayCast2D, _right_ray_cast:RayCast2D):
	enemy_type = Enums.EnemyType.baryonyx
	damage = _damage
	body = _body
	sprite = _enemy_sprite
	left_ray_cast = _left_ray_cast
	right_ray_cast = _right_ray_cast
	behaviour = EnemyBehaviour.new(body, Enums.Behaviour.wandering_left, left_ray_cast, right_ray_cast)
	behaviour.is_flying = true
	animation = EnemyAnimation.new(_enemy_animation, sprite)
	animation.start_animation("fly")
	is_alive = true
	id = id_counter
	id_counter += 1 

func update(delta: float):
	behaviour.steer_enemy(delta)
	animation.update_animation(behaviour)

func kill_enemy() -> void:
	print("Baryonyx roars as it dies!")

func move(direction: Vector2):
	print("Baryonyx stomps towards:", direction)
