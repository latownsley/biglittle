extends Node2D

func play_idle_animation():
	%ShroomSprite.play("idle")

func play_hide_animation():
	%ShroomSprite.play("hide")
	

func play_peek_animation():
	%ShroomSprite.play("peek")
	
func play_pop_animation():
	%ShroomSprite.play("pop")

func play_walk_animation():
	%ShroomSprite.play("walk")

func flip_sprite_left():
	%ShroomSprite.flip_h = true

func flip_sprite_right():
	%ShroomSprite.flip_h = false

func hide_and_peek():
	%ShroomSprite.play("hideandpeek")
