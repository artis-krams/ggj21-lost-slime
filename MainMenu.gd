extends Control

func _ready():
	if Global.is_game_over && !Global.is_victory:
		$GameOver.play()
	elif Global.is_game_over && Global.is_victory:
		$Victory.play()

func _on_BtnStart_pressed():
	Global.reset()
	$AudioStreamPlayer.play()
	get_tree().change_scene('res://Main2D.tscn')

func _on_BtnExit_pressed():
	get_tree().quit()
