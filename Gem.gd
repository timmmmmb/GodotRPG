extends Area2D

func _on_Gem_body_entered(body):
	if body.is_in_group("Player") && !$CollisionShape2D.is_disabled():
		body.increaseScore()
		$CollisionShape2D.set_disabled(true)
		visible = false
		
func restart():
	$CollisionShape2D.set_disabled(false)
	visible = true
