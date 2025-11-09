extends Resource

class_name PlayerAnimation

var animation_tree: AnimationTree
var velocity: Vector2 = Vector2.ZERO
var on_floor: bool = true
var sprite:Sprite2D

func _init(_animation_tree: AnimationTree , _sprite: Sprite2D):
	animation_tree = _animation_tree
	sprite = _sprite

func update_animation(movement_controller: PlayerMovement):
	if movement_controller.direction != 0:
		update_direction(movement_controller.direction)

	if not movement_controller.on_floor:
		if movement_controller.current_velocity.y < 0:
			clear_conditions()
			animation_tree.set("parameters/conditions/jump_up", true)
		elif velocity.y > 0:
			clear_conditions()
			animation_tree.set("parameters/conditions/jump_down", true)
	elif abs(movement_controller.current_velocity.x) < 10:
		clear_conditions()
		animation_tree.set("parameters/conditions/idle", true)
	else:
		clear_conditions()
		if movement_controller.is_shift_down:
			animation_tree.set("parameters/conditions/run", true)
		else:
			animation_tree.set("parameters/conditions/walk", true)

func clear_conditions():
		animation_tree.set("parameters/conditions/idle", false)
		animation_tree.set("parameters/conditions/walk", false)
		animation_tree.set("parameters/conditions/run", false)
		animation_tree.set("parameters/conditions/jump_up", false)
		animation_tree.set("parameters/conditions/jump_down", false)

func update_direction(direction: float):
	if direction > 0:
		turn_left()
	else:
		turn_right()

func turn_left():
	sprite.flip_h = false;

func turn_right():
	sprite.flip_h = true;
