extends Node2D

@onready var game_music = $SFX_GameMusic

func _ready() -> void:
	game_music.play()
