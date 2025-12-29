extends Area2D

var can_enter = false
var player_ref = null
var porta_aberta = false
var interagindo = false
@onready var balao_label: Label = $Balloon
@onready var open_audio = $SFX_Open
@onready var close_audio = $SFX_Close

func _ready() -> void:
	balao_label.visible = false

func _on_body_entered(body) -> void:
	if body.name == "Player":
		can_enter = true
		player_ref = body
		
		if not porta_aberta:
			balao_label.text = "Aperte ENTER"
			balao_label.visible = true
		

func _on_body_exited(body) -> void:
	if body.name == "Player":
		can_enter = false
		player_ref = null
		
		balao_label.visible = false

func key_check():
	if porta_aberta or interagindo:
		return
	interagindo = true
	
	if player_ref.have_key == true:
		porta_aberta = true
		open_audio.play()
		balao_label.text = "Porta Aberta!"
		await open_audio.finished
		get_tree().change_scene_to_file("res://src/modules/ui/vicotry/Victory.tscn")
	else:
		close_audio.play()
		balao_label.text = "Você precisa da chave!"
		await get_tree().create_timer(2.0).timeout
		if can_enter:
			balao_label.text = "Aperte ENTER"
		interagindo = false
	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		if can_enter:
			key_check()
		
		
		
		

		
