extends Control

func _ready():
	$MenuContainer/PlayButton.grab_focus()

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://src/Main.tscn")

func _on_quit_button_pressed():
	get_tree().quit()


func _on_credit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://src/modules/ui/credit/Credit.tscn")
