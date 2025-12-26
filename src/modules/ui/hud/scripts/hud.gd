extends CanvasLayer 

@onready var label_tempo: Label = $Control/TimerLabel
@onready var timer: Timer = $Timer
@onready var clock_sound = $SFX_SlowClock

var tempo_restante: int = 120 

func _ready() -> void:
	atualizar_texto()
	timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout() -> void:
	tempo_restante -= 1
	atualizar_texto()
	
	if tempo_restante <= 0:
		timer.stop()
		game_over()

func atualizar_texto() -> void:
	var minutos = tempo_restante / 60
	var segundos = tempo_restante % 60
	
	label_tempo.text = "%02d:%02d" % [minutos, segundos]
	
	if tempo_restante <= 10:
		label_tempo.modulate = Color.RED
		clock_sound.play()
	else:
		label_tempo.modulate = Color.WHITE
		clock_sound.stop()

func game_over() -> void:
	get_tree().change_scene_to_file("res://src/modules/ui/defeat/Defeat.tscn")
