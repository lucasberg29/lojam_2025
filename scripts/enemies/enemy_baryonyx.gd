#enemy_baryonyx.gd
extends Enemy
class_name EnemyBaryonyx

var enemy_behaviour:EnemyBehaviour
var enemy_animation:EnemyAnimation
var enemy_sprite:Sprite2D
var left_ray_cast:RayCast2D
var right_ray_cast:RayCast2D

func _init(_health: int, _damage: int, _body: CharacterBody2D, 
_enemy_animation: AnimationTree, _enemy_sprite:Sprite2D, 
_left_ray_cast:RayCast2D, _right_ray_cast:RayCast2D):
	super(_health)
	enemy_type = Enums.EnemyType.baryonyx
	damage = _damage
	body = _body
	enemy_sprite = _enemy_sprite
	left_ray_cast = _left_ray_cast
	right_ray_cast = _right_ray_cast
	enemy_behaviour = EnemyBehaviour.new(body, Enums.Behaviour.wandering_left, left_ray_cast, right_ray_cast)
	enemy_animation = EnemyAnimation.new(_enemy_animation, enemy_sprite)

func update(delta: float):
	enemy_behaviour.steer_enemy(delta)
	enemy_animation.update_animation(enemy_behaviour)

func kill_enemy() -> void:
	print("Baryonyx roars as it dies!")

func move(direction: Vector2):
	print("Baryonyx stomps towards:", direction)
