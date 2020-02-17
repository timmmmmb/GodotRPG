extends Area2D

var root

export var rootName = ""

func _ready():
	root = get_tree().get_root()

func changeScene(newScene):
	# Remove the current level
	var menu = root.get_node(rootName)
	root.remove_child(menu)
	menu.call_deferred("free")
	
	# Add the next level
	var next_level_resource = load(newScene)
	var next_level = next_level_resource.instance()
	root.add_child(next_level)


func _on_EndPoint_body_entered(body):
	if body.is_in_group("Player"):
		$Down.visible = false
		$Up.visible = true
		body.respawnPosition = position
		changeScene("res://Level Select.tscn")
