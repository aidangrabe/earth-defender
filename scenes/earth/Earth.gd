extends Node2D


# measured in radians per second
export(float, 0, 100, 0.1) var rotation_speed = 1

onready var sprite = $Sprite


func _process(delta):
	sprite.rotation += rotation_speed * delta
