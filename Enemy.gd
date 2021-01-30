extends KinematicBody2D

var speed = 150
var nav = null setget set_nav
var path = []
var targetPosition = Vector2()

func set_nav(new_nav):
	nav = new_nav
	update_path()

func update_path():
	path = nav.get_simple_path(position, targetPosition, false)
	print_debug(path.size())
	if path.size() == 0:
		queue_free()

func _physics_process(delta):
	if path.size() > 1:
		var d = position.distance_to(path[0])
		if d > 2:
			position = position.linear_interpolate(path[0], (speed * delta)/d)
		else:
			path.remove(0)
	else:
		queue_free()
