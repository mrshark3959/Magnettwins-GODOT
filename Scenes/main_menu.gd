extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Access the singleton (MusicManager) and stop the music if it's playing
	Backgroundaudio.stop_music()
