extends Navigation2D

export(float) var character_speed = 100.0
var path = []
var mob = preload("res://Enemy.tscn")
var mob2 = preload("res://EnemyFlower.tscn")
var spawnPosition = Vector2()
onready var character = $Enemy

func _ready():
	var routePoints = get_node("Level/RoutePoints").get_children()
	
	for n in range(10):
		var m = mob.instance()
		add_child(m)
		m.position = routePoints[n].position
		m.nav = self
		m.setRoute(routePoints)
	
	for n in range(10):
		var m = mob2.instance()
		add_child(m)
		m.position = routePoints[10 + n].position
		m.nav = self
		m.setRoute(routePoints)
