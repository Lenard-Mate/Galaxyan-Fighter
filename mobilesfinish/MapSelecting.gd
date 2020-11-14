extends Node2D

func _ready():
	pass 

const SAVE_DIR = "user://saves/"
var save_path = SAVE_DIR+"save.dat"

func save():
	var data={
		
		"level2" : GlobalVariable.level2, 
		"level3" : GlobalVariable.level3
	}
	var dir = Directory.new()
	if !dir.dir_exists(SAVE_DIR):
		dir.make_dir_recursive(SAVE_DIR)
	var file = File.new()
	var error = file.open(save_path, File.WRITE)
	if error == OK:
		file.store_var(data)
		file.close()
		
func loade():
	var file = File.new()
	if file.file_exists(save_path):
		var	error = file.open(save_path,File.READ)
		if error == OK:
			var player_data = file.get_var()
			file.close()
			GlobalVariable.level2 = player_data.level2
			GlobalVariable.level3 = player_data.level3
			
func _physics_process(delta):
	$map2.disabled = GlobalVariable.level2
	$map3.disabled = GlobalVariable.level3

func _on_TextureButton_pressed():
	GlobalVariable.player_healt = 25
	GlobalVariable.enemy_kill_counter = 0
	get_tree().change_scene("res://StoryLine1.tscn")	

func _on_TextureButton4_pressed():
	save()
	loade()
	get_tree().change_scene("res://titleScreen.tscn")	

func _on_map2_pressed():
	GlobalVariable.player_healt = 25
	GlobalVariable.enemy_kill_Destroyer = 0
	save()
	loade()
	get_tree().change_scene("res://storyline2.tscn")	

func _on_map3_pressed():
	GlobalVariable.player_healt = 25
	GlobalVariable.enemy_healt_bar = 0
	save()
	loade()
	get_tree().change_scene("res://storyline3.tscn")	
