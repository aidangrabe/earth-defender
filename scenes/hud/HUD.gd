extends Node2D


onready var turret_picker = $TurretPicker


func _ready():
  turret_picker.visible = false

func show_turret_picker(callback):
  turret_picker.callback = callback
  turret_picker.visible = true

