extends AnimatableBody2D

@onready var maincollision = $CollisionShapeclosed
@onready var animation = $AnimatedSprite2D
@onready var characterdetector = $characterdetector

var animationplayed = false

func _ready() -> void:
	animation.play("idle")
	maincollision.disabled = false  


func _on_button_2_button_pressed(state: bool) -> void:
	if state:  
		if not animationplayed:
			animation.play("open")
			$"../dooropen".play()
			animationplayed = true
			maincollision.set_deferred_thread_group("disabled",true) 
	else: 
		animation.play("idle")
		animationplayed = false
		maincollision.disabled = false  
