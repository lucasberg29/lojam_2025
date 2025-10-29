extends Label

var time: float = 0.0

func _process(delta: float) -> void:
	time += delta                  # increment time
	text = "Timer: " + str(round(time))     # show time rounded to 2 decimals
