extends CharacterBody2D

const PLAYER_SPEED := 130.0
const PLAYER_RUNNING_SPEED := 300
const ACCELERATION := 800.0
const FRICTION := 600.0
const JUMP_VELOCITY := -350.0
const RUNNING_JUMP_VELOCITY := -450.0
var gravity_modifier = 1.0

const JUMP_INCREMENT = 5.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var current_velocity = 0
var on_floor = false
var is_shift_down = false
var is_jump_down = false
var direction: float

var animation_controller:PlayerAnimation

func _ready():
	animation_controller = PlayerAnimation.new($AnimationTree, $Sprite2D)

func _physics_process(delta: float) -> void:
	update_movement(delta)
	animation_controller.update_animation(direction, current_velocity, on_floor, is_shift_down)

func update_movement(delta: float):
	if not is_on_floor():
		velocity.y += gravity * delta / gravity_modifier
		on_floor = false
	else:
		on_floor = true
		velocity.y = 0.0
	
	is_jump_down = Input.is_action_pressed("jump")
	is_shift_down = Input.is_action_pressed("run")

	if Input.is_action_just_pressed("jump") and is_on_floor():
		if is_shift_down:
			velocity.y = RUNNING_JUMP_VELOCITY
		else:
			velocity.y = JUMP_VELOCITY

	if not is_on_floor() and velocity.y < 0 and is_jump_down:
		velocity.y -= JUMP_INCREMENT

	direction = Input.get_axis("move_left", "move_right")

	if direction != 0:
		var target_speed := direction * PLAYER_SPEED
		
		if is_shift_down:
			target_speed = direction * PLAYER_RUNNING_SPEED
		
		if is_jump_down:
			target_speed *= 1.5
		
		velocity.x = move_toward(velocity.x, target_speed, ACCELERATION * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)

	move_and_slide()
	current_velocity = velocity

func pick_up_egg():
	pass
