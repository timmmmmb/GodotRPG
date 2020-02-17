extends Control

var root

func _ready():
	root = get_tree().get_root()

func changeScene(newScene):
	# Remove the current level
	var menu = root.get_node("Level Select")
	root.remove_child(menu)
	menu.call_deferred("free")
	
	# Add the next level
	var next_level_resource = load(newScene)
	var next_level = next_level_resource.instance()
	root.add_child(next_level)


func _on_Level01_pressed():
	changeScene("res://Level01.tscn")


func _on_Level02_pressed():
	pass # Replace with function body.


func _on_Level03_pressed():
	pass # Replace with function body.


func _on_Level04_pressed():
	pass # Replace with function body.
