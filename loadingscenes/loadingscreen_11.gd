extends Control

@export var next_scene: String = 'res://Scenes/main_menu.tscn'



func _ready():
	Backgroundaudio.stop_music()

	# Preload the next scene into memory
	var next_scene_resource = ResourceLoader.load(next_scene)

	

	# Start timer to transition after 2 seconds
	await get_tree().create_timer(4).timeout


	# Change to the next scene without showing grey background
	get_tree().change_scene_to_packed(next_scene_resource)
