extends Node2D

var paused = false		

@onready var player = get_node("/root/Game/Level/Player")


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
	
