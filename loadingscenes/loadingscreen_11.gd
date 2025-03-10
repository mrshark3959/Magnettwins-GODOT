extends Control

@export var next_scene: String = 'res://Scenes/main_menu.tscn'
@onready var time: Label = $Time

var time_elapsed_msec = Time.get_ticks_msec()
var time_elapsed_sec = time_elapsed_msec / 1000

var time_elapsed_min = time_elapsed_sec / 60
var time_elapsed_leftover = time_elapsed_sec % 60

func _ready():
	Backgroundaudio.stop_music()
	$AudioStreamPlayer.play()
	# Preload the next scene into memory
	var next_scene_resource = ResourceLoader.load(next_scene)
	print("Time: " + str(time_elapsed_min) + " Minutes " + str(time_elapsed_leftover) + " Seconds ")
	$Time.set_text("Time: " + str(time_elapsed_min) + " Minutes " + str(time_elapsed_leftover) + " Seconds ")

	

	# Start timer to transition after 2 seconds
	await get_tree().create_timer(5).timeout


	# Change to the next scene without showing grey background
	get_tree().change_scene_to_packed(next_scene_resource)
