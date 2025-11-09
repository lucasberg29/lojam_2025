#enemy_animation.gd
extends Resource

class_name EnemyAnimation

var animation_tree:AnimationTree

var velocity: Vector2 = Vector2.ZERO
var on_floor: bool = true
var sprite:Sprite2D

func _init(_animation_tree: AnimationTree , _sprite: Sprite2D):
	animation_tree = _animation_tree
	sprite = _sprite


func update_animation(enemy_behaviour: EnemyBehaviour):
	if enemy_behaviour.current_direction != 0:
		update_direction(enemy_behaviour.current_direction)

	#clear_conditions()
	animation_tree.set("parameters/conditions/walk", true)

	#if not enemy_behaviour.on_floor:
		#if enemy_behaviour.velocity.y < 0:
			#clear_conditions()
			#animation_tree.set("parameters/conditions/jump_up", true)
		#elif velocity.y > 0:
			#clear_conditions()
			#animation_tree.set("parameters/conditions/jump_down", true)
	#elif abs(enemy_behaviour.velocity.x) < 10:
		#clear_conditions()
		#animation_tree.set("parameters/conditions/idle", true)
	#else:
		#clear_conditions()
		#animation_tree.set("parameters/conditions/walk", true)

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
