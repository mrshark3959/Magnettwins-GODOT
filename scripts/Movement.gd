extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const PUSH_FORCE := .0
const MIN_PUSH_FORCE := 5.0

func _ready() -> void:
	get_node("Texture").play("default")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		if velocity.x > 0:
			scale = Vector2(3,3)
			rotation_degrees = 0
		if velocity.x < 0:
			scale = Vector2(3,-3)
			rotation_degrees = 180
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if direction != 0 && get_node("Texture").animation != "walk":
		get_node("Texture").play("walk")
	if direction == 0 && get_node("Texture").animation != "default":
		get_node("Texture").play("default")

	move_and_slide()
	
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			var push_force = (PUSH_FORCE*velocity.length() / SPEED) + MIN_PUSH_FORCE
			c.get_collider().apply_central_impulse(-c.get_normal()*push_force)
