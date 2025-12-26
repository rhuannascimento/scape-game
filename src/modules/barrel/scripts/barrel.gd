extends Area2D

var player_inside := false
var player: Node = null

@onready var animacao = $AnimatedSprite2D
@onready var open_chest_audio = $SFX_ChestOpening


func _ready():
	monitoring = true
	z_index = 5
	animacao.frame = 0 
	animacao.stop()

func _on_body_entered(body):
	if body.is_in_group("player"):
		player_inside = true
		player = body
		animacao.play("static")
		open_chest_audio.play()
		give_bomb()

func _on_body_exited(body):
	if body.is_in_group("player"):
		player_inside = false

func try_interact():
	if player_inside:
		give_bomb()

func give_bomb():
	print(player)
	if player:
		player.receive_bomb()
	#queue_free()
