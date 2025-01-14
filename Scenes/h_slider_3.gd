extends HSlider

@onready var brightness = Brightness.get_node("brightnesscolor")


func _on_value_changed(value: float) -> void:
	brightness.color = Color(0, 0, 0, 1 - value)
