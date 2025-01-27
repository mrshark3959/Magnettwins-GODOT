extends Node2D

signal button_pressed(state: bool)

@onready var collisionshapetop = $StaticBody2D/collisionshapetop
@onready var sprite = $StaticBody2D/AnimatedSprite2D

var onbutton := false  # Track button state

func _ready() -> void:
	collisionshapetop.position = Vector2(-0.516, -0.5)
	sprite.play("up")

func _on_topchecker_body_entered(body: Node2D) -> void:
	if body.name == "Magnus" or body is RigidBody2D:
		onbutton = true
		_activate_button()
		emit_signal("button_pressed", true)  # Send signal for pressed

func _on_topchecker_body_exited(body: Node2D) -> void:
	if body.name == "Magnus" or body is RigidBody2D:
		onbutton = false
		_deactivate_button()
		emit_signal("button_pressed", false)  # Send signal for released

func _activate_button() -> void:
	sprite.play("down")
	collisionshapetop.position = Vector2(0, 3)
	$buttonclick.play()
func _deactivate_button() -> void:
	sprite.play("up")
	collisionshapetop.position = Vector2(-0.516, -0.5)
