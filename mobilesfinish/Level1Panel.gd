extends Panel


func _physics_process(delta):
	$Label.text="Enemy ships destroyed: "+str(GlobalVariable.enemy_kill_counter)
