extends Node2D

var paused : bool = false

@onready var player = $World/Player


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
	#get_tree().root.add_child(simultaneous_scene)
	#get_node("res://level_0.tscn").free()
	get_tree().change_scene_to_file("res://ENDGameMenu.tscn")

func _on_end_game_tree_body_entered(body):
	call_deferred("_add_a_scene_manually")
