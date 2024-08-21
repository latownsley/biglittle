extends Sprite2D

func play_walk_front():
	%AnimationPlayer.play("walk_front")

func play_walk_balk():
	%AnimationPlayer.play("walk_back")

func play_walk_left():
	%AnimationPlayer.play("walk_left")

func play_attack_front():
	%AnimationPlayer.play("attack_front")

func play_attack_side():
	%AnimationPlayer.play("attack_side")

func play_attack_back():
	%AnimationPlayer.play("attack_back")

func play_hurt_front():
	%AnimationPlayer.play("hurt_front")

func play_hurt_side():
	%AnimationPlayer.play("hurt_side")

func play_hurt_back():
	%AnimationPlayer.play("hurt_back")

func play_idle_front():
	%AnimationPlayer.play("idle")

func play_idle_side():
	%AnimationPlayer.play("idle_side")

func play_idle_back():
	%AnimationPlayer.play("idle_back")

func stop_animation():
	%AnimationPlayer.stop()
