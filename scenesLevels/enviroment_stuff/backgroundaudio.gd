extends AudioStreamPlayer

func _ready():
	# Ensure the music doesn't stop when changing scenes
	process_mode = Node.PROCESS_MODE_ALWAYS
	
	# Connect the finished signal to restart playback
	connect("finished", Callable(self, "_on_finished"))

func play_music():
	if not playing:
		play()

func stop_music():
	if playing:
		stop()

func _on_finished():
	# Restart playback when the audio finishes
	play()
