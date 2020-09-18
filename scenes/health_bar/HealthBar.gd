extends Node2D


export(int) var health_max = 100
export(int) var health_current = 100

export(int) var width = 50
export(int) var height = 10
export(int) var padding = 0
export(int) var border_width = 1

export(Color) var color_border = Color.red
export(Color) var color_health = Color.green

var rect_border = Rect2(0, 0, width, height)
var rect_health = Rect2(0, 0, width, height)


func _ready():
  calculate_health_rect()
  update()


func _draw():
  rect_border.size.x = width
  rect_border.size.y = height

  # health bar
  draw_rect(rect_health, color_health, true)

  # border
  draw_rect(rect_border, color_border, false, border_width)


func calculate_health_rect():
  var health_start_offset = padding + border_width
  var health_end_offset = padding * 2 + border_width * 2
  var health_percentage = health_current / health_max as float

  rect_health.size.y = height - health_end_offset
  rect_health.position.y = health_start_offset

  rect_health.size.x = (health_percentage * width) - health_end_offset
  rect_health.position.x = health_start_offset

