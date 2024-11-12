extends StaticBody2D

var accel = 500
var velocity = Vector2(0,0)

func _ready() -> void:
	pass

func get_input():
	var input_direction = Input.get_vector("a", "d", "w", "s")
	velocity = input_direction * accel
	if input_direction.x > 0:
		get_node("Texture").flip_h = true
	if input_direction.x < 0:
		get_node("Texture").flip_h = false

func _physics_process(_delta):
	get_input()
	translate(velocity * _delta)

func pull_object():
	pass

func blink():
	if randf_range(0, 10) > 8:
		get_node("Texture").play("Blink")

func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	blink()


func _on_texture_animation_looped() -> void:
	get_node("Texture").play("Default")
