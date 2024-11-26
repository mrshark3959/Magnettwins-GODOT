extends StaticBody2D

var accel = 500
var velocity = Vector2(0, 0)
var is_frozen = false

func _ready() -> void:
	pass

func get_input():
	if is_frozen:
		velocity = Vector2.ZERO
		return  # Stop processing input if frozen

	var input_direction = Input.get_vector("a", "d", "w", "s")
	velocity = input_direction * accel
	if input_direction.x > 0:
		get_node("Texture").flip_h = true
	if input_direction.x < 0:
		get_node("Texture").flip_h = false

func _physics_process(_delta):
	get_input()
	translate(velocity * _delta)

func freeze():
	is_frozen = true
	velocity = Vector2.ZERO  # Reset velocity to stop movement

func unfreeze():
	is_frozen = false
