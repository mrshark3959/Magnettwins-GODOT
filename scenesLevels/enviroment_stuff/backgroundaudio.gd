extends AudioStreamPlayer

func _ready():
	# Ensure the music doesn't stop when changing scenes
	process_mode = Node.PROCESS_MODE_ALWAYS

func play_music():
	if not playing:
		play()

func stop_music():
	if playing:
		stop()
