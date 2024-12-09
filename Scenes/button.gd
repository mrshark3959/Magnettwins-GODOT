extends Area2D

# Reference to the AnimatedSprite2D and CollisionShape2D nodes
@onready var animation = $Buttonpress
@onready var collisionshape = $buttoncollisionshape
@onready var ferrus = $Ferrus/Area2D/Maincollisionshape
var is_pressed
# Define the movement distance
var press_offset = Vector2(0, 5)  # Moves the collision shape 5 pixels down
var target_frame = 3  # Frame to pause at

func _ready():
	# Initialize the button's state
	collisionshape.position = Vector2(0, 0)
	animation.play("Idle")

# Signal handlers for area and body entry
func _on_area_entered(area: Area2D) -> void:
	# Trigger when an Area2D enters
	animation.play("Button Press")
	_check_animation_completion()
	_pressed()


# Check if the animation has reached the last frame
func _check_animation_completion():
	if animation.animation == "Button Press":
		animation.pause()  # Stop the animation
		animation.play("buttonhelddown")

# Pause the animation at a specific frame
func _pause_at_frame(frame: int):
	animation.stop()  # Stop the animation
	animation.frame = frame  # Set to the desired frame

# Button pressed logic
func _pressed():
	collisionshape.position = press_offset
	is_pressed = true
# Button released logic
func _released():
	collisionshape.position = Vector2(0, 0)

# Signal handlers for exiting
func _on_area_exited(area: Area2D) -> void:
	# Reset the button when the interaction ends
	animation.play("buttonrelease")
  # Reset to Idle after release
	_released()

func _on_body_exited(body: Node2D) -> void:
	# Reset the button when the interaction ends
	animation.play("buttonrelease")
  # Reset to Idle after release
	_released()

# Reset animation to Idle
func _on_idle_animation():

	animation.play("Idle")
