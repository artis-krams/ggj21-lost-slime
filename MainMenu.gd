extends Control

func _on_BtnStart_pressed():
	$AudioStreamPlayer.play()
	get_tree().change_scene('res://Main2D.tscn')
	

func _on_BtnExit_pressed():
	get_tree().quit()
