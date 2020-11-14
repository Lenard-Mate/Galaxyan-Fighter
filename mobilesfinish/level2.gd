extends Node2D

export (int) var number_of_enemies = 2

var enemy = preload("res://Destroyer.tscn")
var enemy2 = preload("res://DestroyerImplementation/Destroyerleve2.tscn")

export var x = 0
export var y = 0


func _ready():
	$Timerenemy.start()
	$Destroyertimer.start()
	
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
			

func random_Destroyer():
	var rand2= RandomNumberGenerator.new()
	var x2 = 2
	var screen_size2 = get_viewport().get_visible_rect().size

	rand2.randomize()
	for i in range(0, 1):
		
			var xRange= rand2.randf_range(1200, 1500)
			var yRange= rand2.randf_range(25, screen_size2.y-25)
		
			var enemy_instance2 = enemy2.instance()
			
			var pos = Vector2()
			pos.x = xRange
			pos.y = yRange
			enemy_instance2.position = pos
		
			add_child(enemy_instance2)	
								
func _physics_process(delta):
	if GlobalVariable.enemy_kill_Destroyer >= 3:
		GlobalVariable.level3 = false
		GlobalVariable.enemy_kill_Destroyer = 0
		get_tree().change_scene("res://YouWin.tscn")
		
func _on_Timerenemy_timeout():
	random_enemys()


func _on_Destroyertimer_timeout():
	random_Destroyer()
