extends Path2D
var offset = 0;
func _process(delta):
	offset += delta*100
	$PathFollow2D.set_offset(offset)
