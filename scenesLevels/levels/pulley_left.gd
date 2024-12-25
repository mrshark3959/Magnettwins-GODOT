extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Disable gravity for this RigidBody2D
	gravity_scale = 0  # No gravity effect

# Called every physics frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	linear_velocity = Vector2.ZERO  # Prevents unintended movement
