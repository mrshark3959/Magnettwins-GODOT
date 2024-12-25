extends StaticBody2D

@onready var pulleyright = $"."
@onready var pulleyleft = $"../pulley left"



func _ready() -> void:
	pulleyright.position = Vector2(23, 10)
	pulleyleft.position = Vector2(-23, 85)
	pulleyright.gravity_scale = 0
	
func _on_body_entered(body: RigidBody2D) -> void:
	var speed = 1 # Change this to increase it to more units/second
	pulleyright.position = position.move_toward(Vector2(23,85), speed)
	pulleyleft.position = position.move_toward(Vector2(-23,10), speed)
