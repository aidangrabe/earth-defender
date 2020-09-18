extends Node2D


export(int) var health = 4

onready var sprite = $Sprite
onready var health_bar = $HealthBar

var rng = RandomNumberGenerator.new()


func _ready():
  sprite.rotation = rng.randf() * PI * 2

func _process(_delta):
  pass

