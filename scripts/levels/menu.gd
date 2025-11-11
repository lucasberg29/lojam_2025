extends Node2D


func _ready():
	MusicManager.add_song_to_queue("Desert [Ambience]","res://audio/music/Desert [Ambience].wav")
	MusicManager.add_song_to_queue("Monastic Traditions [Exploration]","res://audio/music/Monastic Traditions [Exploration].wav")
	MusicManager.play_music()
	
