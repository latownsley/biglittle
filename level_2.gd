extends Node2D

var paused = false		

@onready var player = get_node("/root/Game/World/Player")
var simultaneous_scene = preload("res://leve_1.tscn").instantiate()


func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pause_menu()

func pause_menu():
	if paused:
		%PauseMenu.hide()
		%World.get_tree().paused = false
	else:
		%PauseMenu.show()
		%World.get_tree().paused = true
	
	paused = !paused


func _on_player_health_depleted():
	%World.get_tree().paused = true
	%GameOver.show()
	


func _add_a_scene_manually():
	get_tree().root.add_child(simultaneous_scene)
	get_tree().change_scene_to_packed(simultaneous_scene)

func _on_to_leve_1_body_entered(body):
	call_deferred("_add_a_scene_manually")
