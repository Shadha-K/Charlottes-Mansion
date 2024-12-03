extends ProgressBar

@onready var damage_bar: ProgressBar = $DamageBar
@onready var timer: Timer = $Timer

var health = 0 : set = _set_health

func _set_health(new_health):
	var prev_health = health
	health = min(max_value, new_health)
	value = health

	if health <= 0:
		queue_free()

	if health < prev_health:
		timer.start()
	elif is_instance_valid(damage_bar):
		damage_bar.value = health

func init_health(_health):
	max_value = _health
	value = _health
	if is_instance_valid(damage_bar):
		damage_bar.max_value = _health
		damage_bar.value = _health

func _on_timer_timeout() -> void:
	if is_instance_valid(damage_bar):
		damage_bar.value = health
