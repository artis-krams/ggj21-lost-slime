extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	
	if !Input.is_action_pressed("right") && !Input.is_action_pressed("left") && !Input.is_action_pressed("up") && !Input.is_action_pressed("down"):
		$AnimatedSprite.play("idle")
		
	if Input.is_action_pressed('down'):
		$AnimatedSprite.play("run_up")
		velocity.y += 1
	if Input.is_action_pressed('up'):
		$AnimatedSprite.play("run_down")
		velocity.y -= 1
	if Input.is_action_pressed('right'):
		$AnimatedSprite.play("run_right")
		velocity.x += 1
	if Input.is_action_pressed('left'):
		$AnimatedSprite.play("run_left")
		velocity.x -= 1
		
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
