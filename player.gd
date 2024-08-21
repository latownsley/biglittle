extends CharacterBody2D

@onready var dash = %Dash

signal health_depleted

var health : float = 100.0
const MAX_HEIGHT : Vector2 = Vector2(1.75, 1.75)
const MIN_HEIGHT : Vector2 = Vector2(.5, .5)
const SPEED : int = 300
var dash_duration : float = 0.2
var dash_speed : int = 1200
const DAMAGE_RATE : float = 5.0
#var animation_direction : 

func _physics_process(delta):
	# Dash
	if Input.is_action_just_pressed("dash") && !dash.is_dashing() && dash.dash_off_cooldown():
		dash.start_dash(dash_duration)
	
	# Movement
	var direction = Input.get_vector("left", "right", "up", "down")
	if dash.is_dashing():
		velocity = direction * dash_speed
	else:
		velocity = direction * SPEED
	move_and_slide()
	
	# Damage
	var overlapping_bodies = %HurtBox.get_overlapping_bodies()
	if overlapping_bodies.size() > 0:
		if !dash.dash_off_cooldown() or dash.is_dashing():
			for body in overlapping_bodies:			
				if body.has_method("take_damage"):
					body.take_damage(delta)
					%DamageSound.play()
					
		else:
			for body in overlapping_bodies:
				if body.has_method("return_type"):
						var body_type = body.return_body_type()	
						if body_type == 'enemy':
							health -= DAMAGE_RATE * overlapping_bodies.size() * delta
							update_health()
	
	# Animation
	if velocity.length() > 0.0:
		
		if direction == Vector2.LEFT:
			%Shroom.flip_sprite_left()
			%Shroom.play_walk_animation()
		
		elif direction == Vector2.RIGHT:
			%Shroom.flip_sprite_right()
			%Shroom.play_walk_animation()		
		
		else:
			%Shroom.play_walk_animation()		

	else:
		%Shroom.play_idle_animation()
	
	# Abilities
	if Input.is_action_just_pressed("grow"):
		grow_big()
	
	if Input.is_action_just_pressed("shrink"):
		grow_small()


	
func update_health():
	%ProgressBar.value = health
	if health <= 0.0:
		health_depleted.emit()

func grow_big():
	if self.get_scale() == MAX_HEIGHT:
		pass
	else:
		self.set_scale(self.get_scale() + Vector2(.25, .25))

func grow_small():
	if self.get_scale() == MIN_HEIGHT:
		pass
	else:	
		self.set_scale(self.get_scale() - Vector2(.25, .25))
	
func take_damage():
	health -= DAMAGE_RATE
	update_health()

