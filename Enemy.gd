extends Area2D

var speed = 90
var nav = null setget set_nav
var path = []
var targetPosition = Vector2()
var route = Array()
var currentRoutePointIndex = 1
var playerNode = null
	
func set_nav(new_nav):
	nav = new_nav
	update_path()

func setRoute(new_route):
	route = new_route
	
func update_path():
	path = nav.get_simple_path(position, targetPosition, false)

func nextTarget():
	if(currentRoutePointIndex < route.size()):
		currentRoutePointIndex += 1
	else:
		currentRoutePointIndex = 0
	targetPosition = route[currentRoutePointIndex - 1].position
	update_path()

func _process(delta):
	if is_instance_valid(playerNode):
		if targetPosition != playerNode.position && targetPosition.distance_to(playerNode.position) > 30:
			print_debug(playerNode.position)
			targetPosition = playerNode.position
			update_path()
		
	if path.size() > 1:
		var d = position.distance_to(path[0])
		if d > 2:
			position = position.linear_interpolate(path[0], (speed * delta)/d)
		else:
			path.remove(0)
	else:
		nextTarget()

func _on_Enemy_body_entered(body):
	if body.get_collision_layer_bit(0):
		print_debug('dieded')


func _on_SightRangeArea2D_body_entered(body):
	if body.get_collision_layer_bit(0) && body.position.x != 0:
		print_debug('follow')
		print_debug(body.position)
		playerNode = body


func _on_SightRangeArea2D_body_exited(body):
		playerNode = null
		nextTarget()
