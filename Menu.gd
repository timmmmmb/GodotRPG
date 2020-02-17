extends Control

var root

func _ready():
	root = get_tree().get_root()

func _on_LevelButton_pressed():
	# Remove the current level
	var menu = root.get_node("Menu")
	root.remove_child(menu)
	menu.call_deferred("free")
	
	# Add the next level
	var next_level_resource = load("res://Level Select.tscn")
	var next_level = next_level_resource.instance()
	root.add_child(next_level)
