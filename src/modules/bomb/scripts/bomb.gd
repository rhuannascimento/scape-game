extends CharacterBody2D

@export var explosion_time := 1.5
@export var explosion_radius := 2

@onready var explosion_audio = $SFX_Explosion

var breakable_layer: TileMapLayer = null
var carrier: Node2D = null
var is_carried := false
var state := State.idle

enum State {
	idle,
	pulsing,
	exploding
}

func set_breakable_layer(layer: TileMapLayer):
	breakable_layer = layer

func attach_to(player: Node2D, hold_point: Marker2D):
	carrier = player
	is_carried = true
	reparent(hold_point)
	position = Vector2.ZERO
	$CollisionShape2D.disabled = true

func detach(drop_global_position: Vector2):
	is_carried = false
	reparent(get_tree().current_scene)
	global_position = drop_global_position
	carrier = null
	$CollisionShape2D.disabled = false
	
	start_pulsing()

func start_pulsing():
	state = State.pulsing
	$AnimatedSprite2D.play("timer")

func start_explosion():
	state = State.exploding
	$AnimatedSprite2D.play("explosion")
	explosion_audio.play()
	breakable_layer.explode_at_world_position(global_position, explosion_radius)

func finish_explosion():
	queue_free()

func _on_animated_sprite_2d_animation_finished() -> void:
	match state:
		State.pulsing:
			start_explosion()
		
		State.exploding:
			finish_explosion()
