extends StaticBody2D

var accel = 7
var velocity = Vector2(0,0)

func get_input():
	var input_direction = Input.get_vector("a", "d", "w", "s")
	velocity = input_direction * accel
	if input_direction.x > 0:
		get_node("Texture").flip_h = true
	if input_direction.x < 0:
		get_node("Texture").flip_h = false

func _physics_process(_delta):
	get_input()
	translate(velocity)

func pull_object():
	pass
