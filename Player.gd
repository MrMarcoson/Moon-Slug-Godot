extends KinematicBody2D

var direction = Vector2()
var movement_speed = 30.0
var hp = 3

func _process(delta):
	
	if Input.is_key_pressed(KEY_D):
		direction.x = 1.0
		$AnimatedSprite.animation = 'Walk'
		$AnimatedSprite.flip_h = true
		
	elif Input.is_key_pressed(KEY_A):
		direction.x = -1.0
		$AnimatedSprite.animation = 'Walk'
		$AnimatedSprite.flip_h = false
		
	else: 
		$AnimatedSprite.animation = 'Idle'
		direction.x = 0;
	
	move_and_slide(direction.normalized() * movement_speed)
