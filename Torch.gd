extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play('torch')

func play_anim(anim):
	$AnimationPlayer.play(anim)

func _on_Torch_body_entered(body):
	if body.is_in_group('player'):
		print_debug('is player!')
		body.hold_item(self)
