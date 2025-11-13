extends Panel


func _on_pause_pressed():
	MusicManager.pause_music()

func _on_play_resume_pressed():
	MusicManager.resume_music()

func _on_next_pressed():
	MusicManager.next_song()
	
