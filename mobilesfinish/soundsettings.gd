extends Node2D

func _ready():
	pass 

func _on_MasterVolume_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)

func _on_soundbutton_pressed():
	visible = not visible

func _on_TextureButton_pressed():
	visible = not visible


func _on_Music_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), value)


func _on_Efects_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Efects"), value)
