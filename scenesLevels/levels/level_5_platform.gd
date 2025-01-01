extends AnimatableBody2D

var button1pressed = false
var button2pressed = false
var animationplayed = false

@onready var animation = $"platform move"
@onready var button1 = $"../button2"  # Path to first button
@onready var button2 = $"../button"   # Path to second button
@onready var platform = $CollisionShape2D


func _ready() -> void:
	# Position relative to parent
	var parent_position = get_parent().position
	platform.position = parent_position + Vector2(-95, -11)

	# Connect button signals to automatically detect presses
	button1.button_pressed.connect(_on_button1_pressed)
	button2.button_pressed.connect(_on_button2_pressed)

func _on_button1_pressed(state: bool) -> void:
	button1pressed = state
	playanimation()

func _on_button2_pressed(state: bool) -> void:
	button2pressed = state
	playanimation()

func playanimation():
	# Only play animation if both buttons are pressed and hasn't played yet
	if button1pressed and button2pressed and not animationplayed:
		animation.play("expand")
		animationplayed = true  # Prevent replay
