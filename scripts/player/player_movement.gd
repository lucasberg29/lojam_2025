extends Resource

class_name PlayerMovement

var on_floor: bool

const PLAYER_SPEED := 130.0
const PLAYER_RUNNING_SPEED := 300
const ACCELERATION := 800.0
const FRICTION := 600.0
const JUMP_VELOCITY := -350.0
const RUNNING_JUMP_VELOCITY := -450.0
const JUMP_INCREMENT = 5.0
var gravity_modifier = 1.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var current_velocity = 0
var is_shift_down = false
var is_jump_down = false
var direction: float

var character: CharacterBody2D

func _init(_character: CharacterBody2D):
	character = _character
	on_floor = true

func update_movement(delta: float, _on_floor:bool) -> Vector2:
	on_floor = _on_floor
	if not on_floor:
		character.velocity.y += gravity * delta / gravity_modifier
		on_floor = false
	else:
		on_floor = true
		character.velocity.y = 0.0
	
	is_jump_down = Input.is_action_pressed("jump")
	is_shift_down = Input.is_action_pressed("run")

	if Input.is_action_just_pressed("jump") and on_floor:
		if is_shift_down:
			character.velocity.y = RUNNING_JUMP_VELOCITY
		else:
			character.velocity.y = JUMP_VELOCITY

	if not on_floor and character.velocity.y < 0 and is_jump_down:
		character.velocity.y -= JUMP_INCREMENT

	direction = Input.get_axis("move_left", "move_right")

	if direction != 0:
		var target_speed := direction * PLAYER_SPEED
		
		if is_shift_down:
			target_speed = direction * PLAYER_RUNNING_SPEED
		
		if is_jump_down:
			target_speed *= 1.5
		
		character.velocity.x = move_toward(character.velocity.x, target_speed, ACCELERATION * delta)
	else:
		character.velocity.x = move_toward(character.velocity.x, 0, FRICTION * delta)

	character.move_and_slide()
	current_velocity = character.velocity
	return current_velocity
