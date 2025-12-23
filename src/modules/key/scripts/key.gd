extends Area2D




func _on_body_entered(body) -> void:
	if body.name == "Player":
		print("Tem chave? ", body.have_key)
		body.have_key = true
		print("Tem chave? ", body.have_key)
		queue_free()
