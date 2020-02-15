extends Area2D

export (String) var message = ""

func _ready():
	$Label.text = message
	$Label.visible = false

func _on_Timer_timeout():
	$Label.visible = false

func _on_Sign_body_entered(_body):
	$Label.visible = true
	$MessageTimer.start(0)
