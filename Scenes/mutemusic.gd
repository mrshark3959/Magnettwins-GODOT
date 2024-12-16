extends TextureButton

var musicmainm = AudioServer.get_bus_index("mainmenumusic")


func _on_pressed() -> void:
	print("Mute button pressed")
	AudioServer.set_bus_mute(musicmainm, not AudioServer.is_bus_mute(musicmainm))
