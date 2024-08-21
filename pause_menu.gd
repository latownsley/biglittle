extends Control

@onready var game = $"../.."


func _on_resume_pressed():
	game.pause_menu()


func _on_main_menu_pressed():
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
