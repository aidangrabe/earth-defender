extends TextureButton


signal on_click(button)


export(int) var cost = 100

onready var shop = get_tree().get_nodes_in_group("shop")[0]


func _process(_delta):
	if not visible:
		return

	enable_if_affordable()

func _on_TurretPickerButton_pressed():
	# no need to check if affordable, the button will be disabled in that case
	emit_signal("on_click", self)
	shop.purchase(cost)
	

func affordable():
	return shop.can_afford(cost)

func enable_if_affordable():
	disabled = not affordable()

	# TODO change alpha value when disabled. How do you do that??
