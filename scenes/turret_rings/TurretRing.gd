extends Node2D


# measured in pixels
export(int) var ring_radius = 128
export(int) var number_of_turret_slots = 2

# measured in radians per second
export(float) var rotation_speed = -0.5

export(Color) var ring_color = Color.red
export(bool) var draw_ring = false


var TurretSlot = load("res://scenes/turret_slots/TurretSlot.tscn")


### Lifecycle functions

func _ready():
	create_turret_slots()

	update()

func _process(delta):
	rotation += rotation_speed * delta

func _draw():
	if draw_ring:
		draw_arc(position, ring_radius, 0, PI * 2, 32, ring_color)


### Helper functions

func create_turret_slots():
	var next_slot_position = Vector2(ring_radius, 0)
	var sector_size = (PI * 2) / number_of_turret_slots

	for i in number_of_turret_slots:
		next_slot_position = next_slot_position.rotated(sector_size)
		create_turret_slot(next_slot_position)

func create_turret_slot(next_slot_position):
	var new_slot = TurretSlot.instance()
	new_slot.position = next_slot_position
	add_child(new_slot)

