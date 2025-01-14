extends AnimatableBody2D

@onready var maincollision = $CollisionShapeclosed
@onready var animation = $AnimatedSprite2D
@onready var characterdetector = $characterdetector

var animationplayed = false
var button1pressed = false
var button2pressed = false

func _ready() -> void:
	animation.play("idle")
	maincollision.disabled = false  







func _on_negativebutton_button_pressed(state: bool) -> void:
	button1pressed = true
	print("negative button pressed")
	open()
func _on_positivebutton_button_pressed(state: bool) -> void:
	
	button2pressed = true
	print("positive button pressed")
	open()
func open():
	if button1pressed == true and button2pressed == true:
		animation.play("open")
		maincollision.set_deferred_thread_group("disabled",true) 
	
