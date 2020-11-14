extends KinematicBody2D

const GRAVITY = 0
const SPEED = -150
const FLOOR = Vector2(0, -1)

var directionY = false

onready var timer = get_node("Timer")
var reset_state=false


const Fier = preload("res://finalBoss/FinelBossFier.tscn")
onready var fier = get_node("Fier")
var fierbool = false
var velocity = Vector2()
var is_dead = false


func _physics_process(delta):
	if is_dead == false:
		
		velocity.x = SPEED
		velocity.y = GRAVITY
		
		if get_global_position().x > get_viewport().get_visible_rect().size.x - 200:
			velocity = move_and_slide(velocity,FLOOR)
		else :
			if get_global_position().y < get_viewport().get_visible_rect().size.y - 40 and directionY == false:
				velocity.x = 0
				velocity.y = 150
				velocity = move_and_slide(velocity,FLOOR)
				$AnimatedSprite.play("move")
			else:
				directionY = true
				velocity.x = 0
				velocity.y = -150
				velocity = move_and_slide(velocity,FLOOR)
				if 	get_global_position().y < 0 + 50 and directionY == true:
					directionY = false
		if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "player" in get_slide_collision(i).collider.name:
					is_dead = true
		if fierbool == false:
			$Fier.start()
			fierbool = true
			var fierball = Fier.instance()
			get_parent().add_child(fierball)
			fierball.position = $Position2D.global_position							
	else:
		if reset_state == false:
			timer.start()
			$AnimatedSprite.play("explosions")
			$Explosions.play()
			reset_state = true

func enemy_dead():
	is_dead=true

func _on_Timer_timeout():
		timer.stop()
		queue_free()

func _on_Area2D_body_entered(body):
	if body != self:
		is_dead = true


func _on_Fier_timeout():
	fierbool = false
