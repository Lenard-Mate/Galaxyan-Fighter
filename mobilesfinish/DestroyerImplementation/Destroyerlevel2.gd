extends KinematicBody2D

const GRAVITY = 0
const SPEED = -150
const FLOOR = Vector2(0, -1)


onready var timer = get_node("Timer")
var reset_state=false


const Fier = preload("res://enemyfier.tscn")
onready var fier = get_node("Fier")
var fierbool = false
var velocity = Vector2()
var is_dead = false


func _physics_process(delta):
	if is_dead == false:
		velocity.x=SPEED
		velocity.y=GRAVITY
		velocity = move_and_slide(velocity,FLOOR)
		$AnimatedSprite.play("move")
		if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "player" in get_slide_collision(i).collider.name:
					is_dead=true
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
			GlobalVariable.enemy_kill_Destroyer += 1

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
