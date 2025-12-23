extends Area2D

var can_enter = false
var player_ref = null

func _on_body_entered(body) -> void:
	if body.name == "Player":
		can_enter = true
		player_ref = body
		

func _on_body_exited(body) -> void:
	if body.name == "Player":
		can_enter = false
		player_ref = null

func key_check():
	if player_ref.have_key == true:
		print("Porta aberta")	
	else:
		print("Voce não possui a chave")
	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		if can_enter:
			key_check()
		
		
		
		

		
