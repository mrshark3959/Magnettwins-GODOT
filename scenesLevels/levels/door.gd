extends AnimatableBody2D

@onready var maincollision = $CollisionShapeclosed
@onready var animation = $AnimatedSprite2D
@onready var characterdetector = $characterdetector

var animation_played = false  # Track if the animation has been played
var sound_played = false      # Track if the sound has been played
var button1pressed = false
var button2pressed = false

func _ready() -> void:
	animation.play("idle")
	maincollision.disabled = false  # Enable collision initially

func _on_negativebutton_button_pressed(state: bool) -> void:
	button1pressed = true
	print("negative button pressed")
	open()

func _on_positivebutton_button_pressed(state: bool) -> void:
	button2pressed = true
	print("positive button pressed")
	open()

func open():
	if button1pressed and button2pressed and not animation_played:
		animation.play("open")
		animation_played = true  # Set the flag to true

		# Play the sound only once
		if not sound_played:
			$"../dooropen".play()
			sound_played = true  # Set the flag to true

		maincollision.set_deferred("disabled", true)  # Disable collision
