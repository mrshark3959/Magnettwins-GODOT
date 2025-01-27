extends Control

@export var level_name: String = "Level 3"
@export var tip_text: String = "Fun Fact: In some ancient stories, Ferrus represents the 'iron' and stability of magnetic forces, 
while Magnus symbolizes the fiery, dynamic pull of magnetism. "
@export var next_scene: String = 'res://scenesLevels/levels/level_3.tscn'

# UI Elements
@onready var level_label = $levellabel
@onready var tip_label = $tiplabel
@onready var fade_animation = $AnimationPlayer

func _ready():
	# Set the text for the labels
	level_label.text = level_name
	tip_label.text = tip_text
	Backgroundaudio.play_music()
	$ferrisnoises.play()
	# Preload the next scene into memory
	var next_scene_resource = ResourceLoader.load(next_scene)

	# Play the fade-in animation
	fade_animation.play("fade_in")

	# Start timer to transition after 2 seconds
	await get_tree().create_timer(2.8).timeout

	# Play fade-out animation
	fade_animation.play("fade_out")
	await fade_animation.animation_finished

	# Change to the next scene without showing grey background
	get_tree().change_scene_to_packed(next_scene_resource)
