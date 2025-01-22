extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _integrate_forces() -> void:
	var velocity1 = get_node("RigidBody2D").linear_velocity.y
	var velocity2 = get_node("RigidBody2D2").linear_velocity.y
	get_node("RigidBody2D").apply_central_force(Vector2(0, -1 * velocity2))
	get_node("RigidBody2D2").apply_central_force(Vector2(0, -1 * velocity1))
