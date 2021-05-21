extends Node2D

onready var enemy = preload("res://Enemy.tscn")
var enemy_instance
var score = 0
var game_over = false

func _ready():
	$Soundtrack.play()

func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
			get_tree().quit()
	
	if game_over == true:
		if Input.is_key_pressed(KEY_Y):
			get_tree().reload_current_scene()

func _on_Timer_timeout():
	enemy_instance = enemy.instance()
	enemy_instance.connect("hurt_player", self, "hurt_player")
	enemy_instance.connect("score_point", self, "score_point")
	enemy_instance.speed = 20.0 + score / 8
	enemy_instance.position = Vector2(rand_range(0, 96), -20)
	add_child(enemy_instance)

func score_point():
	score += 1
	$Score_sound.play()
	$GUI/Score.text = "Score: " + String(score)
	$Player.movement_speed = 30.0 + score / 8
	
	if $Timer.wait_time > 1.01:
		$Timer.wait_time -= 0.01
	
func hurt_player():
	$Player.hp -= 1
	$Hit_sound.play()
	
	if $Player.hp == 2:
		$GUI/hp1.visible = false
	elif $Player.hp == 1:
		$GUI/hp2.visible = false
	else:
		$GUI/hp3.visible = false
		end_game()

func end_game():
	$Player/AnimatedSprite.visible = false
	$GUI/game_over.visible = true
	$GUI/Score2.visible = true
	game_over = true
