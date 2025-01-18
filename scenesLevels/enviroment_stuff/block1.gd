extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	custom_integrator = true  # Enable the custom integrator

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	apply_central_impulse(Vector2(0.1, 0.1))  # Apply a central force every frame

# Implement custom physics behavior
func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	state.angular_velocity = 0  # Prevent rotation
