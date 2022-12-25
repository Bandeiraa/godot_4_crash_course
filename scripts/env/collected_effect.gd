extends AnimatedSprite2D

func _ready() -> void:
	playing = true
	
	
func on_animation_finished() -> void:
	queue_free()
