extends Node2D

var dash_delay : float = 0.4
var can_dash : bool = true

@onready var duration_timer = %DurationTimer


func start_dash(duration):
	duration_timer.wait_time = duration
	duration_timer.start()
	%WhooshSound.play()

func is_dashing():
	return !duration_timer.is_stopped()

func end_dash():
	can_dash = false
	await get_tree().create_timer(dash_delay).timeout
	can_dash = true

func dash_off_cooldown():
	return can_dash

func _on_duration_timer_timeout():
	end_dash()
