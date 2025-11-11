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
