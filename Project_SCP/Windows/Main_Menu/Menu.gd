extends Control


func _on_button_pressed():
	get_tree().quit()


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Levels/Level_test.tscn")
