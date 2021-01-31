extends Node

var is_game_over = false
var is_victory = false

var current_time = 0
var high_score

func reset():
	is_game_over = false
	is_victory = false
	current_time = 0

func game_over(victory):
	is_victory = victory
	if victory && !high_score || high_score > current_time:
		high_score = current_time
		
	is_game_over = true
	get_tree().change_scene('res://MainMenu.tscn')
