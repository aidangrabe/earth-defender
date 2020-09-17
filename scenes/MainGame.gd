extends Node2D

export var initial_gold = 0

var gold = 0


func _ready():
  gold = initial_gold


func purchase(cost):
  var old_gold = gold
  gold -= cost
  print("Purchased item: gold was ", old_gold, " new gold is ", gold, " item value was ", cost)

func can_afford(cost):
  return gold >= cost

