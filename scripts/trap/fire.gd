extends StaticBody2D

@onready var state_timer: Timer = get_node("StateTimer")
@onready var animation: AnimationPlayer = get_node("Animation")

var max_health: int = 0

var is_invincible: bool = false
var current_state: String = "off"

@export var damage: int
@export var health: int = 15

func _ready() -> void:
	max_health = health
	
	
func on_state_timer_timeout():
	state_timer.start()
	
	if current_state == "off":
		current_state = "on"
		is_invincible = true
		animation.play(current_state)
		return
		
	if current_state == "on":
		current_state = "off"
		is_invincible = false
		animation.play(current_state)
		return
		
		
func on_detection_area_body_entered(body) -> void:
	if body.is_in_group("mask_dude"):
		body.update_health(global_position, damage, "decrease")
		
		
func update_health(value: int) -> void:
	if is_invincible:
		return
		
	health = clamp(health - value, 0, max_health)
	
	if health == 0:
		state_timer.stop()
		is_invincible = true
		current_state = "off"
		animation.play(current_state)
		
		return
		
	animation.play("hit")
	
	
func on_animation_finished(anim_name: String) -> void:
	if anim_name == "hit":
		animation.play(current_state)
