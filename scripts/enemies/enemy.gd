#enemy.gd
extends Resource
class_name Enemy

enum EnemyType { SLIME, BAT, GOBLIN, BOSS }

var id: int
var enemy_type: EnemyType
var health: int
var damage: int

func _init(_health: int):
	health = _health

func hit_enemy(_damage: int):
	health -= _damage
	if health <= 0:
		kill_enemy()

func kill_enemy():
	pass
