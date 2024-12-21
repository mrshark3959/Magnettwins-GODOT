extends Button

@onready var settingsmenu = $"../.."


func _on_pressed() -> void:
	settingsmenu.hide()
