extends Node

@onready var music_player: AudioStreamPlayer = $MusicPlayer

var current_song : AudioStream = null

func ready():
	get_tree().get_root().add_child(self)
	self.owner = null
	
