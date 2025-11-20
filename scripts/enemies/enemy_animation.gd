#enemy_animation.gd
extends Resource

class_name EnemyAnimation

var animation_tree:AnimationTree

var velocity: Vector2 = Vector2.ZERO
var on_floor: bool = true
var sprite:Sprite2D

var is_walking: bool = false

func _init(_animation_tree: AnimationTree , _sprite: Sprite2D):
	animation_tree = _animation_tree
	sprite = _sprite
	clear_conditions()

func start_animation(animation: String):
	var folder_dir = "parameters/conditions/"
	var folder_and_animation = folder_dir + animation
	clear_conditions()
	animation_tree.set(folder_and_animation, true)

func update_animation(enemy_behaviour: EnemyBehaviour):
	if enemy_behaviour.current_direction != 0:
		update_direction(enemy_behaviour.current_direction)

func clear_conditions():
		animation_tree.set("parameters/conditions/idle", false)
		animation_tree.set("parameters/conditions/walk", false)
		animation_tree.set("parameters/conditions/attack", false)
		animation_tree.set("parameters/conditions/dead", false)
		animation_tree.set("parameters/conditions/hurt", false)
		animation_tree.set("parameters/conditions/fly", false)

func update_direction(direction: float):
	if direction > 0:
		turn_left()
	else:
		turn_right()

func turn_left():
	sprite.flip_h = true;

func turn_right():
	sprite.flip_h = false;
