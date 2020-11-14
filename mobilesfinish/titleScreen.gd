extends Node2D


func _ready():
	$MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()

func _physics_process(delta):
	if $MarginContainer/VBoxContainer/VBoxContainer/TextureButton.is_hovered() == true:
		$MarginContainer/VBoxContainer/VBoxContainer/TextureButton.is_hovered()	
	if $MarginContainer/VBoxContainer/VBoxContainer/TextureButton2.is_hovered() == true:
		$MarginContainer/VBoxContainer/VBoxContainer/TextureButton2.is_hovered() 

var loade = preload("res://MapSelecting.tscn")

func _on_TextureButton_pressed():
	get_tree().change_scene("res://MapSelecting.tscn")
	var	loadegame = loade.instance()
	loadegame.loade()
func _on_TextureButton2_pressed():
	get_tree().quit()


func _on_TextureButton3_pressed():
	get_tree().change_scene("res://selectNave.tscn")
