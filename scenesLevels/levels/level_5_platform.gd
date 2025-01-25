extends AnimatableBody2D

var button1pressed = false
var button2pressed = false
var animationplayed = false
var animationplayed2 = false
@onready var animation = $"platform move"
@onready var button1 = $"../button2"  # Path to first button
@onready var button2 = $"../button"   # Path to second button
@onready var platform = $CollisionShape2D
@onready var sound = $platformmoveing  # AudioStreamPlayer for the sound

func _ready() -> void:
	# Connect button signals to automatically detect presses
	button1.button_pressed.connect(_on_button1_pressed)
	button2.button_pressed.connect(_on_button2_pressed)
	# Connect animation finished signal
	animation.animation_finished.connect(_on_animation_finished)

func _on_button1_pressed(state: bool) -> void:
	button1pressed = state
	playanimation()

func _on_button2_pressed(state: bool) -> void:
	button2pressed = state
	playanimation()

func _on_animation_finished(anim_name: String) -> void:
	# Pause the sound when the animation finishes
	if anim_name == "expand":
		sound.stream_paused = true  # Pause the sound
		animationplayed2 = true

func playanimation():
	# Only play animation if both buttons are pressed and hasn't played yet
	if button1pressed and button2pressed and not animationplayed:
		sound.play()  # Play the sound
		animation.play("expand")
		animationplayed = true  # Prevent replay
	
