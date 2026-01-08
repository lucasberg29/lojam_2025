#enemy.gd
extends Resource
class_name Enemy

static var id_counter: int = 0 

var id: int
var enemy_type: Enums.EnemyType
var health: int
var damage: int
var is_alive: bool
var is_dying: bool

var behaviour: EnemyBehaviour
var body: CharacterBody2D
var animation: EnemyAnimation
var sprite: Sprite2D

func update(_delta: float):
	pass

func hit_enemy(_damage: int):
	health -= _damage
	if health <= 0:
		kill_enemy()
		is_dying = true
		is_alive = false
		animation.start_animation("dead")
	else:
		animation.start_animation("hurt")
	return is_alive

func kill_enemy():
	body.velocity.x = 0

func move(_direction: Vector2):
	print("Enemy base class updating! YOU SHOULD NOT SEE THIS!")

func resume_behaviour():
	pass
