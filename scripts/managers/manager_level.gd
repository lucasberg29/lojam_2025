extends Node

func _input(event):
	if event.is_action_pressed("pause_game"):
		ManagerUi.pause_game()
		
	if event.is_action_pressed("return"):
		ManagerUi.resume_game()
