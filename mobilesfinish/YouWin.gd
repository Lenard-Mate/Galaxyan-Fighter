extends Node2D


func _ready():
	$TextureButton.grab_focus()

func _physics_process(delta):
	if $TextureButton.is_hovered() == true:
		$TextureButton.grab_focus()
	if $TextureButton2.is_hovered() == true:
		$TextureButton2.grab_focus()		

func _on_TextureButton_pressed():
	get_tree().change_scene("res://MapSelecting.tscn")
	GlobalVariable.enemy_kill_counter = 0
	GlobalVariable.player_healt = 25
	
func _on_TextureButton2_pressed():
	get_tree().change_scene("res://titleScreen.tscn")
	GlobalVariable.enemy_kill_counter = 0
	GlobalVariable.player_healt = 25
