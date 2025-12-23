extends CharacterBody2D

@export var speed: float

@export var bomb_scene: PackedScene

@onready var bomb_hold_point: Node2D = $BombHoldPoint
@onready var bomb_drop_point: Node2D = $BombDropPoint

@onready var brekable_layer: TileMapLayer = get_tree().root.get_node("Main/TileMap/BrekableObstacleLayer")

var carried_bomb: Node2D = null

func _ready() -> void:
	speed = 150
	z_index = 10

func receive_bomb():
	if carried_bomb:
		return

	var bomb = bomb_scene.instantiate()
	get_tree().current_scene.add_child(bomb)
	bomb.attach_to(self, bomb_hold_point)
	carried_bomb = bomb
	bomb.set_breakable_layer(brekable_layer)

func drop_bomb():
	if not carried_bomb:
		return

	carried_bomb.detach(bomb_drop_point.global_position)
	carried_bomb = null

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

func _physics_process(delta: float) -> void:
	var dx = Input.get_axis("move_left", "move_right")
	var dy = Input.get_axis("move_up", "move_down")
	
	position.x += dx * delta * speed
	position.y += dy * delta * speed
	
	if (Input.is_action_just_pressed("drop_bomb")):
		drop_bomb()
	
	animate_sprite(Vector2(dx, dy))
	move_and_slide()
