extends Area2D

var direction = Vector2(0, 1)
var speed = 20
signal score_point
signal hurt_player

func _process(delta):
	position += direction * speed * delta
	
	if(position.y > 95):
		emit_signal("hurt_player")
		queue_free()


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		emit_signal("score_point")
		queue_free()

