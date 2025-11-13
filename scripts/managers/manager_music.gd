extends Node

@onready var music_player: AudioStreamPlayer = AudioStreamPlayer.new()

var songs: Array[Song] = []

var current_song_index : int = 0 
var current_song : Song = null

var is_looping: bool = false
var is_playing: bool = false

func _ready():
	add_child(music_player)
	self.owner = null
	process_mode = Node.PROCESS_MODE_ALWAYS

func _process(_delta):
	if is_playing:
		UpdateSong()
		

func UpdateSong():
	if is_looping and not current_song.playing:
		if not current_song.playing:
			music_player.play()

func add_song_to_queue(song_name: String, preload_str: String):
	var audio_stream = load(preload_str)
	var song = Song.new(song_name, audio_stream)
	songs.append(song)

func play_music():
	current_song_index = randi_range(0, songs.size() - 1)
	current_song = songs[current_song_index]
	music_player.stream = current_song.stream
	music_player.play()
	is_playing = true

func select_random_song():
	current_song_index = randi_range(0, songs.size() - 1)
	current_song = songs[current_song_index]
	music_player.stream = current_song.stream

func pause_music():
	if is_playing:
		music_player.stream_paused = true
		is_playing = false

func resume_music():
	if not is_playing:
		music_player.stream_paused = false
		is_playing = true

func next_song():
	if songs.size() > 1:
		if current_song_index < songs.size() - 1:
			current_song_index += 1
		else:
			current_song_index = 0

		current_song = songs[current_song_index]
		music_player.stream = current_song.stream
		
		if is_playing:
			music_player.play()


class Song:
	var name: String
	var stream: AudioStream

	func _init(_name: String, _stream: AudioStream) -> void:
		name = _name
		stream = _stream
