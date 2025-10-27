extends Control

@export var quit_button_path: NodePath

@onready var quit_button: NodePath = $VBoxContainer/Quit_Button

func _ready():
	var btn = get_node(quit_button)
	btn.connect("pressed", Callable(self, "_on_quit_button_pressed"))

func _on_quit_button_pressed():
	get_tree().quit()
