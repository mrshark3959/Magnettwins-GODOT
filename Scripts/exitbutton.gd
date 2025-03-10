extends Button

@onready var settingsmenu = $"../.."
@export var next_scene: String = 'res://Scenes/main_menu.tscn'

func _on_pressed() -> void:
	
	
	$"../../click".play()
	$"../../Timer1".start()
	
	
	
	
func _on_timer_1_timeout() -> void:
	settingsmenu.hide()
