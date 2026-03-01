extends AudioStreamPlayer2D

var step_sounds := ["res://assets/audio/data_pion-st1-footstep-sfx-323053.mp3","res://assets/audio/data_pion-st2-footstep-sfx-323055.mp3","res://assets/audio/data_pion-st3-footstep-sfx-323056.mp3"]
var current

func step_sounds_controller() -> void:
	current = step_sounds.pick_random()
	stream = current
