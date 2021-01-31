extends Area2D

func _on_VictoryExit_body_entered(body):
	if body.is_in_group('player'):
		Global.game_over(true)
