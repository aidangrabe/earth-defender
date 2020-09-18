extends Node2D


onready var click_area = $ClickArea
onready var add_turret_sprite = $Sprite

var current_turret: Node2D = null
var random_gen = RandomNumberGenerator.new()


func _init():
	random_gen.randomize()

func _process(_delta):
	# we need to rotate the item back so that it's always facing upright
	rotation = -get_parent().rotation
	

### Signals

func _on_ClickArea_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.is_pressed():
			on_click()


### Other

func on_turret_picked(turret):
	# TODO create the corresponding turret
	add_turret()

func is_empty():
	return current_turret == null

func on_click():
	if is_empty():
		show_turret_picker()

func show_turret_picker():
	get_tree().call_group("HUD", "show_turret_picker", self)

func add_turret():
	add_turret_sprite.visible = false

	var Turret = load("res://scenes/turrets/Turret.tscn")
	var turret = Turret.instance()

	#turret.rotation = random_gen.randf() * PI * 2

	add_child(turret)

	current_turret = turret

	return turret

