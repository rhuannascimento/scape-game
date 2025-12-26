extends Control

func _ready():
	visible = false
	get_tree().paused = false
	$MenuContainer/Back.grab_focus()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		alternar_pause()

func alternar_pause():
	var estado_atual = get_tree().paused
	get_tree().paused = not estado_atual
	
	visible = not estado_atual
	
func _on_back_to_menu_pressed() -> void:
	alternar_pause()
	get_tree().change_scene_to_file("res://src/modules/ui/menu/MainMenu.tscn")

func _on_back_pressed() -> void:
	alternar_pause()
