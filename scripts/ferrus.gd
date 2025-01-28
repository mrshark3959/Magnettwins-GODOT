extends CharacterBody2D

var accel = 100
var PUSH_FORCE = 0
var MIN_PUSH_FORCE = 5
var is_color_red = true

func _ready() -> void:
	pass

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * accel
	if input_direction.x > 0:
		get_node("Texture").flip_h = true
	if input_direction.x < 0:
		get_node("Texture").flip_h = false
	if Input.is_action_just_pressed("e"):
		if (is_color_red == true):
			is_color_red = false
			get_node("Texture/AnimationPlayer").clear_queue()
			get_node("Texture/AnimationPlayer").queue("to_blue")
			get_node("Texture/AnimationPlayer").queue("blue_idle")
			print("turning blue")
		elif (is_color_red == false):
			is_color_red = true
			get_node("Texture/AnimationPlayer").clear_queue()
			get_node("Texture/AnimationPlayer").queue("to_red")
			get_node("Texture/AnimationPlayer").queue("red_idle")

			print("turning red")
	

func _physics_process(_delta):
	get_input()
	move_and_collide(velocity*2*_delta)

func pull_object():
	pass

func blink():
	if randf_range(0, 10) > 8:
		get_node("Texture").play("Blink")

func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	blink()


#func _on_texture_animation_looped() -> void:
	#get_node("Texture").play("Default")
	
