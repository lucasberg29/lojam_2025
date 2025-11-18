# enemy_baryonyx_body.gd
extends CharacterBody2D

@export var enemy_data: EnemyBaryonyx
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var left_ray_cast: RayCast2D = $LeftRayCast
@onready var right_ray_cast: RayCast2D = $RightRayCast

func _ready():
	var body = self
	enemy_data = EnemyBaryonyx.new(2,1, body, animation_tree, sprite_2d, left_ray_cast, right_ray_cast)

func finish_hurting():
	animation_tree.set("parameters/conditions/hurt", false)

func _process(delta: float):
	var collision = move_and_collide(velocity * delta)
	if collision:
		print("Hit something:", collision.get_collider())
