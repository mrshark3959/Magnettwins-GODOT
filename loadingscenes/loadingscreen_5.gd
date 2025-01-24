extends Control

@export var level_name: String = "Level 5"
@export var tip_text: String = "Fun Fact: The strongest magnetic field ever created in a lab was about 
1200 Tesla (millions of times stronger than Earth's magnetic field)"
@export var next_scene: String = 'res://scenesLevels/levels/level_5.tscn'

@onready var level_label = $levellabel
@onready var tip_label = $tiplabel
@onready var fade_animation = $AnimationPlayer

func _ready():
	# Set the text for the labels
	level_label.text = level_name
	tip_label.text = tip_text

	# Play the fade-in animation
	fade_animation.play("fade_in")
	$ferrisnoises.play()

	# Wait for 1.5 seconds
	await get_tree().create_timer(1.5).timeout

	# Play fade-out animation
	fade_animation.play("fade_out")
	await fade_animation.animation_finished

	# Free unnecessary nodes in the loading screen
	level_label.queue_free()
	tip_label.queue_free()
	await get_tree().create_timer(.06).timeout
	# Load and transition to the next scene
	var next_scene_resource = ResourceLoader.load(next_scene)
	get_tree().change_scene_to_packed(next_scene_resource)
