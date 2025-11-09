#enemy.gd
extends Resource
class_name Enemy

static var id_counter: int = 0 

var id: int
var enemy_type: Enums.EnemyType
var health: int
var damage: int

var behaviour: EnemyBehaviour
var body: CharacterBody2D

func _init(_health: int):
	id = id_counter
	id_counter += 1 
	health = _health

func update(delta: float):
	print("Enemy base class updating! YOU SHOULD NOT SEE THIS!")

func hit_enemy(_damage: int):
	health -= _damage
	if health <= 0:
		kill_enemy()

func kill_enemy():
	print("Enemy.hit_enemy() not implemented")

func move(direction: Vector2):
	print("Enemy base class updating! YOU SHOULD NOT SEE THIS!")
