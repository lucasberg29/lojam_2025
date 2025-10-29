extends Node2D


func _ready():
	MusicManager.add_song_to_queue("Desert [Ambience]","res://audio/Desert [Ambience].wav")
	MusicManager.play_music()
