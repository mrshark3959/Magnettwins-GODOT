extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_pressed("space")):
		set_gravity_space_override_mode(Area2D.SPACE_OVERRIDE_REPLACE)
	else:
		set_gravity_space_override_mode(Area2D.SPACE_OVERRIDE_DISABLED)


func _on_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		body.apply_central_impulse(Vector2(0.1, 0.1))
