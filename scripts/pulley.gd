extends Node2D

@onready var animation = $pulleymovement
@onready var pulleyblockright = $pulleyblockright
@onready var pulleyblockleft = $pulleyblockleft
@onready var audio_player = $AudioStreamPlayer  # Reference to the AudioStreamPlayer

var animation_played = false  # Flag to track if animation has played
var temp_playback_position = 0.0  # Store playback position for pausing/resuming

func _ready() -> void:
	# Connect animation_finished signal
	animation.animation_finished.connect(_on_animation_finished)

func _on_area_2d_body_entered(body: RigidBody2D) -> void:
	# Play animation only if it hasn't played before
	if not animation_played:
		animation.play("pulleymovement")
		audio_player.play()  # Play the audio
		audio_player.seek(temp_playback_position)  # Resume from the saved position

func _on_area_2d_body_exited(body: Node2D) -> void:
	# Pause the animation and audio only if it hasn't finished
	if not animation_played:
		animation.pause()
		temp_playback_position = audio_player.get_playback_position()  # Save playback position
		audio_player.stop()  # Pause the audio

func _on_animation_finished(anim_name: String) -> void:
	# Lock positions and disable physics movement
	animation_played = true  # Mark animation as played
	audio_player.stop()  # Stop the audio when the animation finishes
