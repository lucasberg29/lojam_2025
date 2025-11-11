extends Node2D

var player_node: Node2D

var is_moving_toward_player: bool

@export var sprite_texture: Texture2D
@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

enum SpriteOption { Black, Blue, Cyan, Green, Orange, Purple, Red, White, Yellow }

@export var selected_sprite: SpriteOption = SpriteOption.Black

var sprite_textures: Dictionary = {
	SpriteOption.Black: preload("res://assets/Solid Eggs/Black.png"),
	SpriteOption.Blue: preload("res://assets/Solid Eggs/Blue.png"),
	SpriteOption.Cyan: preload("res://assets/Solid Eggs/Cyan.png"),
	SpriteOption.Green: preload("res://assets/Solid Eggs/Green.png"),
	SpriteOption.Orange: preload("res://assets/Solid Eggs/Orange.png"),
	SpriteOption.Purple: preload("res://assets/Solid Eggs/Purple.png"),
	SpriteOption.Red: preload("res://assets/Solid Eggs/Red.png"),
	SpriteOption.White: preload("res://assets/Solid Eggs/White.png"),
	SpriteOption.Yellow: preload("res://assets/Solid Eggs/Yellow.png")
}

func _ready():
	if sprite_texture:
		sprite.texture = sprite_texture
	else:
		sprite.texture = sprite_textures[selected_sprite]

func _process(_delta: float):
	if is_moving_toward_player:
		move_toward_player()

func _on_body_entered(body: Node2D):
	player_node = body
	$AnimationPlayer.play("pick_up")
	is_moving_toward_player = true

func move_toward_player():
	var target_pos = player_node.global_position
	var speed = 100.0
	var tween = create_tween()
	tween.tween_property(self, "global_position", target_pos, global_position.distance_to(target_pos) / speed)
