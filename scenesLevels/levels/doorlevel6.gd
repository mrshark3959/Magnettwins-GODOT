extends AnimatableBody2D

@onready var maincollision = $CollisionShapeclosed
@onready var animation = $AnimatedSprite2D
@onready var characterdetector = $characterdetector

# Variable to track whether the animation and sound have been played
var animation_played = false

func _ready() -> void:
	animation.play("idle")
	maincollision.set_deferred("disabled", false)  # Enable collision initially

func _on_characterdetector_body_entered(body: CharacterBody2D) -> void:
	if not animation_played:  # Check if the animation and sound have already been played
		animation.play("open")
		$"../dooropen".play()
		maincollision.set_deferred("disabled", true)  # Disable collision
		animation_played = true  # Set the flag to true

func _on_characterdetector_body_exited(body: CharacterBody2D) -> void:
	animation_played = false  # Reset the flag when the character leaves
