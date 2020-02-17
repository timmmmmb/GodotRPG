extends Node2D

var time = 0

func _on_Score_timeout():
	time += 1
	$Player.get_child(6).setTime(time)
