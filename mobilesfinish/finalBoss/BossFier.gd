extends Area2D

const SPEED = 400
var velocity = Vector2()

func _ready():
	pass 

func _physics_process(delta):
	velocity.x=SPEED*delta*-1
	translate(velocity)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Fier_body_entered(body):
	print(body.name)
	if "player" in body.name and body!=self:
		GlobalVariable.player_healt -= 5
	queue_free()
