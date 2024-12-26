extends Node2D

@onready var animation = $pulleymovement
@onready var pulleyblockright = $pulleyblockright
@onready var pulleyblockleft = $pulleyblockleft

var animation_played = false  # Flag to track if animation has played

func _ready() -> void:
	# Set initial positions
	pulleyblockright.position = Vector2(66, -58)
	pulleyblockleft.position = Vector2(0, 0)
	
	# Connect animation_finished signal
	animation.animation_finished.connect(_on_animation_finished)

func _on_area_2d_body_entered(body: RigidBody2D) -> void:
	# Play animation only if it hasn't played before
	if not animation_played:
		animation.play("pulleymovement")

func _on_area_2d_body_exited(body: Node2D) -> void:
	# Pause the animation only if it hasn't finished
	if not animation_played:
		animation.pause()

func _on_animation_finished(anim_name: String) -> void:
	# Lock positions and disable physics movement
	animation_played = true  # Mark animation as played
	
	pulleyblockright.position = Vector2(66,0)
	pulleyblockleft.position = Vector2(0,-58)
