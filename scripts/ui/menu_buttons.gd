extends VBoxContainer

func _ready():
	$Start_Game.connect("pressed", Callable(self, "_on_play_pressed"))
	$Quit_Button.connect("pressed", Callable(self, "_on_quit_pressed"))

func _on_quit_pressed():
	get_tree().quit()

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level.tscn")
