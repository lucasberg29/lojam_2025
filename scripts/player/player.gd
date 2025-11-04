extends CharacterBody2D

const PLAYER_SPEED := 130.0
const ACCELERATION := 800.0
const FRICTION := 600.0
const JUMP_VELOCITY := -300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var current_velocity = 0
var on_floor = false
var direction: float

var animation_controller:PlayerAnimation

func _ready():
	animation_controller = PlayerAnimation.new($AnimationTree, $Sprite2D)

func _physics_process(delta: float) -> void:
	update_movement(delta)
	animation_controller.update_animation(direction, current_velocity, on_floor)

func update_movement(delta: float):
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		on_floor = true
		velocity.y = 0.0

	direction = Input.get_axis("move_left", "move_right")

	if direction != 0:
		var target_speed := direction * PLAYER_SPEED
		velocity.x = move_toward(velocity.x, target_speed, ACCELERATION * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)

	move_and_slide()
	current_velocity = velocity
