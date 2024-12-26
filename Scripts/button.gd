extends Node2D

@onready var collisionshapetop = $StaticBody2D/collisionshapetop
@onready var sprite = $StaticBody2D/AnimatedSprite2D

var onbutton := false  # Track button state

func _ready() -> void:
	# Initial setup
	collisionshapetop.position = Vector2(-0.516, -0.5)
	sprite.play("up")

func _on_topchecker_body_entered(body: Node2D) -> void:
	# Check if the body is Magnus
	if body.name == "Magnus" or body is RigidBody2D:  # Compare name or use body == $"../Magnus"
		onbutton = true
		_activate_button()

func _on_topchecker_body_exited(body: Node2D) -> void:
	# Check if Magnus exits
	if body.name == "Magnus" or body is RigidBody2D:
		onbutton = false
		_deactivate_button()

func _activate_button() -> void:
	# Update visuals and collision shape for 'pressed' state
	sprite.play("down")
	collisionshapetop.position = Vector2(0, 3)

func _deactivate_button() -> void:
	# Reset visuals and collision shape for 'unpressed' state
	sprite.play("up")
	collisionshapetop.position = Vector2(-0.516, -0.5)
