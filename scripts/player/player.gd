extends CharacterBody2D

const PLAYER_SPEED := 130.0
const PLAYER_RUNNING_SPEED := 300
const ACCELERATION := 800.0
const FRICTION := 600.0
const JUMP_VELOCITY := -350.0
const RUNNING_JUMP_VELOCITY := -450.0
var gravity_modifier = 1.0

const JUMP_INCREMENT = 5.0

var player_damage:int = 1

var current_velocity:Vector2
var on_floor = false
var is_shift_down = false
var is_jump_down = false
var direction: float

var hasHitEnemy = false

var animation_controller : PlayerAnimation
var movement_controller: PlayerMovement

@onready var player: CharacterBody2D = $"."

func _ready():
	movement_controller = PlayerMovement.new(player)
	animation_controller = PlayerAnimation.new($AnimationTree, $Sprite2D)

func _physics_process(delta: float) -> void:
	update_controls()
	
	if hasHitEnemy:
		current_velocity = movement_controller.update_movement(delta, on_floor, true)
		hasHitEnemy = false
	else:
		current_velocity = movement_controller.update_movement(delta, on_floor, false)
		
	animation_controller.update_animation(movement_controller)

func update_controls():
	is_jump_down = Input.is_action_pressed("jump")
	is_shift_down = Input.is_action_pressed("run")
	on_floor = is_on_floor()

func pick_up_egg():
	pass

func kill_player():
	print("Game Over")

func _on_stomp_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemies"):
		if body.has_method("hit_enemy"):
			if body.enemy.is_alive:
				hasHitEnemy = true
				body.hit_enemy(player_damage)
