extends Control


func _on_play_pressed():
	get_tree().change_scene_to_file("res://level_0.tscn")


func _on_credits_pressed():
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()
