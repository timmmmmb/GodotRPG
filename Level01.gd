extends Node2D

func _process(_delta):
	if Input.is_action_just_pressed('ui_restart'):
		restart()

func restart():
	$Player.restart()

func _on_HUD_start_game():
	restart()
