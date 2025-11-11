extends Node

var is_game_paused: bool = false

func _input(event):
	if event.is_action_pressed("pause_game"):
		pause_game()
	
	if event.is_action_pressed("return"):
		resume_game()

func pause_game():
	if not is_game_paused:
		is_game_paused = true
		get_tree().paused = is_game_paused

func resume_game():
	if is_game_paused:
		is_game_paused = false
		get_tree().paused = is_game_paused
