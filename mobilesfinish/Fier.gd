extends Area2D


const SPEED = 400
var velocity = Vector2()



func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocity.x=SPEED*delta
	translate(velocity)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()



func _on_Fier_body_entered(body):
	print(body.name)
	if "enemy" in body.name or "Destroyer" in body.name:
		body.enemy_dead()
		queue_free()
	if "FinalBoss" in body.name:
		GlobalVariable.enemy_healt_bar += 1
		queue_free()
	
