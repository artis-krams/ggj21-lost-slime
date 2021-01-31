extends Node

var is_game_over = false
var is_victory = false

func reset():
	is_game_over = false
	is_victory = false

func game_over(victory):
	is_victory = victory
	is_game_over = true
	get_tree().change_scene('res://MainMenu.tscn')
