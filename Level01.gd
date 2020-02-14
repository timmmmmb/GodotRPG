extends Node2D

func _process(delta):
	if Input.is_action_just_pressed('ui_restart'):
		restart()

func restart():
	$Player.position = $SpawnPoint.position
