extends Node2D


func _ready():
	$TextureButton.grab_focus()

func _physics_process(delta):
	if $TextureButton.is_hovered() == true:
		$TextureButton.grab_focus()
	if $TextureButton2.is_hovered() == true:
		$TextureButton2.grab_focus()		


func _on_TextureButton_pressed():
		get_tree().paused = not get_tree().paused
		visible = not visible


func _on_TextureButton2_pressed():
	get_tree().change_scene("res://titleScreen.tscn")	
	get_tree().paused = not get_tree().paused
	visible = not visible

func _on_pausebutton_pressed():
	$TextureButton.grab_focus()
	get_tree().paused = not get_tree().paused
	visible = not visible
