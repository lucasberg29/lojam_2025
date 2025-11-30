# enemy_baryonyx_body.gd
extends CharacterBody2D

@export var enemy_type: Enums.EnemyType

@export var enemy: Enemy
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var left_ray_cast: RayCast2D = $LeftRayCast
@onready var right_ray_cast: RayCast2D = $RightRayCast

var can_be_interacted_with = true

func _ready():
	var body = self
	
	match enemy_type:
		Enums.EnemyType.baryonyx:
			enemy = EnemyBaryonyx.new(2,1, body, animation_tree, sprite_2d, left_ray_cast, right_ray_cast)
		Enums.EnemyType.alanqa:
			enemy = EnemyAlanqa.new(2,1, body, animation_tree, sprite_2d, left_ray_cast, right_ray_cast)

func finish_hurting():
	can_be_interacted_with = true
	enemy.resume_behaviour()

func finish_dying():
	enemy.kill_enemy()
	

func _process(delta: float):
	var collision = move_and_collide(velocity * delta)
	if collision:
		print("Hit something:", collision.get_collider())

func hit_enemy(_damage: int):
	if can_be_interacted_with:
		enemy.hit_enemy(_damage)
		can_be_interacted_with = false
