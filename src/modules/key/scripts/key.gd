extends Area2D


@onready var audio = $SFX_Pegar

func _on_body_entered(body) -> void:
	if body.name == "Player":
		body.have_key = true
		visible = false
		audio.play()
		$CollisionShape2D.set_deferred("disabled", true)
		await audio.finished
		queue_free()
		
