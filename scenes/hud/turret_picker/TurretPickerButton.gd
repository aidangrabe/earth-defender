extends TextureButton


signal on_click(button)


func _on_TurretPickerButton_pressed():
	emit_signal("on_click", self)
