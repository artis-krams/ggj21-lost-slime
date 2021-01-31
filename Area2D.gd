extends Area2D

func _ready():
	$Sprite.set_visible(false)

func _on_Area2D_body_entered(body):
	if body.get_collision_layer_bit(0):
		$Sprite.set_visible(true)
