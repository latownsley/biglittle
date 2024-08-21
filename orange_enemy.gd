extends CharacterBody2D

var health : int = 3
var knocked_back : Vector2 = Vector2.ZERO
var knockback_modifier : float = 1000.0
var type : String = 'enemy'

@onready var player = $"../Player"

func _ready():
	%Bomb.play_idle_front()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position).normalized()
	velocity = direction * 150.0 + knocked_back
	move_and_slide()
	knocked_back = lerp(knocked_back, Vector2.ZERO, 0.1)
	

func return_body_type():
	return type

func take_damage(delta):
	health -= 1
	update_health()
	%Bomb.play_hurt_front()
	
	if health <= 0:
		%Bomb.play_attack_front()
		queue_free()
		
		

func update_health():
	%HealthBar.value = health

	

func knockback(damage_source_position):
	var knockback_direction = damage_source_position.direction_to(self.global_position)
	knocked_back = knockback_direction * knockback_modifier

