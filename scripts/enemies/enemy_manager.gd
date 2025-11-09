extends Node

@export var enemies_paths: Array[NodePath] = []
var enemies: Array[Enemy] = []

func _ready():
	for path in enemies_paths:
		var node = get_node(path) as CharacterBody2D
		if node and node.enemy_data:
			enemies.append(node.enemy_data)

func _process(delta: float) -> void:
	for enemy in enemies:
		print(enemy)
		enemy.update(delta)
