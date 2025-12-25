extends Area2D

var player_inside := false
var player: Node = null

func _ready():
	monitoring = true
	z_index = 5

func _on_body_entered(body):
	if body.is_in_group("player"):
		player_inside = true
		player = body
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
