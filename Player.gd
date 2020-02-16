extends KinematicBody2D

export (int) var run_speed = 400
export (int) var jump_speed = -800
export (int) var gravity = 2400

var velocity = Vector2()
var jumping = false
var dead = false
export var respawnPosition = Vector2(0,0)
var score = 0

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_select')

	if jump and is_on_floor():
		jumping = true
		velocity.y = jump_speed
	if right:
		velocity.x += run_speed
	if left:
		velocity.x -= run_speed

func _physics_process(delta):
	if dead:
		return
	get_input()
	velocity.y += gravity * delta
	if jumping and is_on_floor():
		jumping = false
	if velocity.x != 0 || velocity.y < 0:
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	if velocity.x != 0:
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y < 0:
		$AnimatedSprite.animation = "up"
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
func die():
	$DeathSound.play()
	dead = true
	visible = false
	$CollisionShape2D.disabled = true

func restart():
	position = respawnPosition
	dead = false
	visible = true
	$CollisionShape2D.disabled = false
	
func increaseScore():
	score += 1
	$HUD.update_score(score)

