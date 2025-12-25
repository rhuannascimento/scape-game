extends Area2D

var can_enter = false
var player_ref = null
@onready var balao_label: Label = $Balloon

func _ready() -> void:
	balao_label.visible = false

func _on_body_entered(body) -> void:
	if body.name == "Player":
		can_enter = true
		player_ref = body
		
		balao_label.text = "Aperte ENTER"
		balao_label.visible = true
		

func _on_body_exited(body) -> void:
	if body.name == "Player":
		can_enter = false
		player_ref = null
		
		balao_label.visible = false

func key_check():
	if player_ref.have_key == true:
		balao_label.text = "Porta Aberta!"
		print("Porta aberta")
	else:
		balao_label.text = "Você precisa da chave!"
		print("Voce não possui a chave")
		await get_tree().create_timer(2.0).timeout
		if can_enter:
			balao_label.text = "Aperte ENTER"
	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		if can_enter:
			key_check()
		
		
		
		

		
