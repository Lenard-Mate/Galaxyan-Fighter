extends KinematicBody2D

onready var joystick = get_parent().get_node("Joystick/TouchScreenButton")
const Fier = preload("res://Fier.tscn")
onready var timer = get_node("Timer")
onready var DiedTimer = get_node("DiedTimer")

var reset_state=false
var button_is_pressed = false
var soundPlayTime = 0
var move=Vector2(0, 0)
var diedistrue = false

func _process(delta):
	if GlobalVariable.player_healt > 0:	
		if joystick.get_value().x != 0 and joystick.get_value().y != 0:
			move.x=joystick.get_value().x
			move.y=joystick.get_value().y
			
			if  get_viewport().get_visible_rect().size.x < get_global_position().x+55:
				if  joystick.get_value().x > 0:
					move.x = 0
				else:
					move.x = joystick.get_value().x
			if   0 > get_global_position().x-35 :
				if  joystick.get_value().x < 0:
					move.x = 0
				else:
					move.x = joystick.get_value().x
			if   0 > get_global_position().y-13 :
				if  joystick.get_value().y < 0:
					move.y = 0
				else:
					move.y = joystick.get_value().y
			if   get_viewport().get_visible_rect().size.y < get_global_position().y+32:
				if  joystick.get_value().y > 0:
					move.y = 0
				else:
					move.y = joystick.get_value().y
			$AnimatedSprite.play("move")	
			move_and_slide(move *300)	
		else:
			
			$AnimatedSprite.play("idel")
		if reset_state == false and button_is_pressed == true:
			timer.start()
			reset_state = true
			var fierball = Fier.instance()
			var fierball2 = Fier.instance()
			
			get_parent().add_child(fierball)
			fierball.position = $Position2D.global_position
			get_parent().add_child(fierball2)
			fierball2.position = $Position2D2.global_position
			soundPlayTime += 1
			
			if soundPlayTime == 2:
				soundPlayTime=0
				$Fire.play()
	else:if diedistrue == false:	
			$AnimatedSprite.play("died")
			$PlayerDied.play()
			DiedTimer.start()
			diedistrue = true			
func _on_Timer_timeout():
	timer.stop()
	reset_state = false
	$Fire.stop()


func _on_TextureButton_button_down():
	button_is_pressed = true


func _on_TextureButton_button_up():
	button_is_pressed = false
	


func _on_DiedTimer_timeout():
	queue_free()
	$PlayerDied.stop()
	GlobalVariable.enemy_kill_counter = 0
	GlobalVariable.enemy_kill_Destroyer = 0
	get_tree().change_scene("res://YouDied.tscn")	

func _on_Area2D_body_entered(body):
	if body != self:
		GlobalVariable.player_healt -= 3
