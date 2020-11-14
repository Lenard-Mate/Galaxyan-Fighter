extends Node2D

export (int) var number_of_enemies = 2
var enemy = preload("res://enemy.tscn")
export var x = 0
export var y = 0


func _ready():
	$Timerenemy.start()
	
func random_enemys():
	var rand = RandomNumberGenerator.new()
	var x = 2
	var screen_size = get_viewport().get_visible_rect().size

	rand.randomize()
	for i in range(0, number_of_enemies):
		
			var xRange= rand.randf_range(1200, 1500)
			var yRange= rand.randf_range(25, screen_size.y-25)
		
			var enemy_instance = enemy.instance()
			
			var pos = Vector2()
			pos.x = xRange
			pos.y = yRange
			enemy_instance.position = pos
		
			add_child(enemy_instance)
func _physics_process(delta):
	if GlobalVariable.enemy_kill_counter >= 70:
		GlobalVariable.level2 = false
		GlobalVariable.enemy_kill_counter = 0
		get_tree().change_scene("res://YouWin.tscn")
		

func _on_Timerenemy_timeout():
	random_enemys()
