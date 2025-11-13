extends CanvasLayer

var menu_instance: Node = null
var pause_instance: Node = null

var menu_scene = load("res://scenes/ui/ui_menu.tscn")
var is_in_menu = false

var pause_scene = load("res://scenes/ui/ui_level.tscn")
var is_in_scene = false
var is_scene_paused = false

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func main_menu():
	menu_instance = menu_scene.instantiate()
	add_child(menu_instance)

func level():
	if menu_instance and menu_instance.is_inside_tree():
		menu_instance.queue_free()
		menu_instance = null
	get_tree().change_scene_to_file("res://scenes/levels/level.tscn")

func pause_game():
	if not is_scene_paused:
		is_scene_paused = true
		pause_instance = pause_scene.instantiate()
		add_child(pause_instance)
		get_tree().paused = true

func resume_game():
	if is_scene_paused:
		is_scene_paused = false
		pause_instance.queue_free()
		pause_instance = null
		get_tree().paused = is_scene_paused
