extends Area2D


@onready var audio = $SFX_Pegar

func _on_body_entered(body) -> void:
	if body.name == "Player":
		body.have_key = true
		#visible = false
		audio.play()
		$AnimationPlayer.play("pegar")
		$CollisionShape2D.set_deferred("disabled", true)
		await audio.finished
		if($AnimationPlayer.animation_finished):
			queue_free()
		
