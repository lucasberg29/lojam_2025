extends Label

@onready var song_update: Label = $"."

func _process(delta: float) -> void:
	if MusicManager.is_playing:
		song_update.text = "Playing: " + MusicManager.current_song.name
