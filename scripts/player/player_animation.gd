extends Resource

class_name PlayerAnimation

var animation_tree: AnimationTree
var velocity: Vector2
var on_floor: bool
var sprite:Sprite2D

func _init(_animation_tree: AnimationTree , _sprite: Sprite2D):
	animation_tree = _animation_tree
	velocity = Vector2.ZERO
	on_floor = true
	sprite = _sprite

func turn_left():
	sprite.flip_h = false;

func turn_right():
	sprite.flip_h = true;

func update_animation(direction:float, velocity: Vector2, on_floor: bool, _is_shift_down: bool):
	if direction != 0:
		update_direction(velocity)

	if not on_floor:
		if velocity.y < 0:
			clear_conditions()
			animation_tree.set("parameters/conditions/jump_up", true)
		elif velocity.y > 0:
			clear_conditions()
			animation_tree.set("parameters/conditions/jump_down", true)
	elif abs(velocity.x) < 10:
		clear_conditions()
		animation_tree.set("parameters/conditions/idle", true)
	else:
		clear_conditions()
		if _is_shift_down:
			animation_tree.set("parameters/conditions/run", true)
		else:
			animation_tree.set("parameters/conditions/walk", true)

func clear_conditions():
		animation_tree.set("parameters/conditions/idle", false)
		animation_tree.set("parameters/conditions/walk", false)
		animation_tree.set("parameters/conditions/run", false)
		animation_tree.set("parameters/conditions/jump_up", false)
		animation_tree.set("parameters/conditions/jump_down", false)

func update_direction(velocity: Vector2):
	if velocity.x > 0:
		turn_left()
	else:
		turn_right()
