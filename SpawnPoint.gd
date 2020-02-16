extends Area2D

var activated = false

func _on_SpawnPoint_body_entered(body):
	if body.is_in_group("Player"):
		activated = true
		$Down.visible = false
		$Up.visible = true
		body.respawnPosition = position
