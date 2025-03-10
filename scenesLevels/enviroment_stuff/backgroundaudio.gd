extends AudioStreamPlayer

var has_started = false 

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	connect("finished", Callable(self, "_on_finished"))

	stop()

func play_music():
	if not playing and get_tree().current_scene.scene_file_path == "res://scenesLevels/levels/level_1.tscn":
		play()
		has_started = true 

func stop_music():
	if playing:
		stop()
		has_started = false

func _on_finished():
	if has_started:  
		play()
