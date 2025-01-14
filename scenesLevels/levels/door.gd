extends AnimatableBody2D

@onready var maincollision = $CollisionShapeclosed
@onready var animation = $AnimatedSprite2D
@onready var characterdetector = $characterdetector

# Variable to track whether the animation has been played
var animationplayed = false

func _ready() -> void:
	animation.play("idle")
	maincollision.set_deferred_thread_group("enabled",1) 
