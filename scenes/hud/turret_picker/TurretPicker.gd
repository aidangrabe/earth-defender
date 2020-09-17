extends Control


var callback = null


func _ready():  
  print("I am created!")

### Signals

func _on_GunTurretButton_on_click(button):
	dismiss()
	callback.on_turret_picked(button.name)

func dismiss():
	visible = false


func _on_TurretPicker_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		dismiss()
