extends Panel



func _process(delta):
	$Labelkils.text="Destroy 3 enemy destroyer: "+str(GlobalVariable.enemy_kill_Destroyer)
