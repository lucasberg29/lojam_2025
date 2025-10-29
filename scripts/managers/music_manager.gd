extends Node

@onready var music_player: AudioStreamPlayer = AudioStreamPlayer.new()

var songs: Array[Song] = []
var current_song : Song = null

var is_looping: bool = false
var is_playing: bool = false

func _ready():
	add_child(music_player)
	get_tree().get_root().add_child(self)
	self.owner = null

func _process(delta):
	if is_playing:
		UpdateSong()
		

func UpdateSong():
	if is_looping and not current_song.playing:
		if not current_song.playing:
			music_player.play()

func add_song_to_queue(name: String, preload_str: String):
	var audio_stream = load(preload_str)
	var song = Song.new(name, audio_stream)
	songs.append(song)

func play_music():
	current_song = songs.pick_random()
	music_player.stream = current_song.stream
	music_player.play()
	is_playing = true


class Song:
	var name: String
	var stream: AudioStream

	func _init(_name: String, _stream: AudioStream) -> void:
		name = _name
		stream = _stream
