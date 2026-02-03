extends VBoxContainer
@onready var ui_level: Control = $"../.."

func _on_resume_pressed():
	ManagerUi.resume_game()

func _on_restart_pressed() -> void:
	ManagerUi.level()
	ui_level.queue_free()

func _on_settings_pressed():
	ManagerUi.settings()

func _on_quit_pressed():
	get_tree().quit()
