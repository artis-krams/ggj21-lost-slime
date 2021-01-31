extends Control

func _ready():
	if Global.high_score:
		$LabelHighScore.text = 'HighScore: ' + str(Global.high_score) + ' seconds'
	
	if Global.is_game_over && !Global.is_victory:
		$LabelGameOver.set_visible(true)
		$GameOver.play()
	elif Global.is_game_over && Global.is_victory:
		if Global.current_time > 0:
			$LabelYourTime.text = 'Your time: ' + str(Global.current_time) + ' seconds'
		$LabelVictory.set_visible(true)
		$Victory.play()

func _on_BtnStart_pressed():
	Global.reset()
	$AudioStreamPlayer.play()
	get_tree().change_scene('res://Main2D.tscn')

func _on_BtnExit_pressed():
	get_tree().quit()
