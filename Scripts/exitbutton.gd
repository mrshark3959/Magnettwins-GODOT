extends Button

@onready var settingsmenu = $"../.."
@export var next_scene: String = 'res://Scenes/main_menu.tscn'

func _on_pressed() -> void:
	settingsmenu.hide()
	
