extends CharacterBody2D

@export var speed: float

var have_key = false
func _ready() -> void:
	speed = 150

func animate_sprite(dv: Vector2):
	if(dv[0] != 0):
		if(dv[0] > 0):
			$AnimatedSprite2D.play("move_right")
		else:
			$AnimatedSprite2D.play("move_left")
	elif(dv[1] != 0):
		if(dv[1] > 0):
			$AnimatedSprite2D.play("move_down")
		else:
			$AnimatedSprite2D.play("move_up")
	else:
		$AnimatedSprite2D.stop()

func _process(delta: float) -> void:
	var dx = Input.get_axis("move_left", "move_right")
	var dy = Input.get_axis("move_up", "move_down")
	
	position.x += dx * delta * speed
	position.y += dy * delta * speed
	
	animate_sprite(Vector2(dx, dy))
	move_and_slide()
