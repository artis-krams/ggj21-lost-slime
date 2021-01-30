extends Navigation2D


export(float) var character_speed = 100.0
var path = []
var mob = preload("res://Enemy.tscn")
var spawnPosition = Vector2()
onready var character = $Enemy

func _ready():
	var routePoints = get_node("Level/RoutePoints").get_children()
	var nav = get_closest_point(routePoints[0].position)
	print_debug(nav)
	
	var m = mob.instance()
	add_child(m)
	m.position = routePoints[0].position
	m.targetPosition = routePoints[2].position
	m.nav = self
	
