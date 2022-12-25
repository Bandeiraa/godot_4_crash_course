extends Sprite2D

var on_action: bool = false

@export var animation: AnimationPlayer = null
@export var mask_dude: CharacterBody2D = null
@export var dust_particles: GPUParticles2D = null

func animate(velocity: Vector2) -> void:
	change_orientation_based_on_direction(velocity.x)
	
	if on_action:
		dust_particles.emitting = false
		return
		
	if velocity.y != 0:
		dust_particles.emitting = false
		vertical_move_behavior(velocity.y)
		return
		
	horizontal_move_behavior(velocity.x)
	
	
func change_orientation_based_on_direction(direction: float) -> void:
	if direction > 0:
		flip_h = false
		
	if direction < 0:
		flip_h = true
		
		
func action_behavior(action: String) -> void:
	animation.play(action)
	on_action = true
	
	
func vertical_move_behavior(direction: float) -> void:
	if direction > 0:
		animation.play("fall")
		
	if direction < 0:
		animation.play("jump")
		
		
func horizontal_move_behavior(direction: float) -> void:
	if direction != 0:
		animation.play("run")
		dust_particles.emitting = true
		return
		
	animation.play("idle")
	dust_particles.emitting = false
	
	
func on_animation_finished(anim_name: String) -> void:
	on_action = false
	
	if anim_name == "hit":
		mask_dude.on_knockback = false
		
	if anim_name == "dead":
		hide()
		transition_screen.fade_in()
