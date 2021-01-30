extends KinematicBody2D

export (int) var speed = 200

var held_item

var velocity = Vector2()

func _process(delta):
	if held_item:
		if velocity.x > 0:
			held_item.play_anim('torch_r')
		elif velocity.x < 0:
			held_item.play_anim('torch_l')
		held_item.position += global_position

func get_input():
	velocity = Vector2()
	var time = $FootSteps.get_playback_position() + AudioServer.get_time_since_last_mix()
	
	if !Input.is_action_pressed("right") && !Input.is_action_pressed("left") && !Input.is_action_pressed("up") && !Input.is_action_pressed("down"):
		$AnimatedSprite.play("idle")
		$FootSteps.stop()
		time = 0
		
	if Input.is_action_pressed('down'):
		$AnimatedSprite.play("run_up")
		$FootSteps.play(time)
		velocity.y += 1
	if Input.is_action_pressed('up'):
		$AnimatedSprite.play("run_down")
		$FootSteps.play(time)
		velocity.y -= 1
	if Input.is_action_pressed('right'):
		$AnimatedSprite.play("run_right")
		$FootSteps.play(time)
		velocity.x += 1
	if Input.is_action_pressed('left'):
		$AnimatedSprite.play("run_left")
		$FootSteps.play(time)
		velocity.x -= 1
		
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

func hold_item(item):
	held_item = item
	print_debug(held_item)
