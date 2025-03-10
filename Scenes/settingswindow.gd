extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$settingsbarrier/TabContainer/Settings/HSlider2.value = db_to_linear(AudioServer.get_bus_volume_db(0))
	Backgroundaudio.stop_music()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_h_slider_2_mouse_exited() -> void:
	release_focus()
