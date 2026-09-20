extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collectedsoundeffect: AudioStreamPlayer2D = $Collectedsoundeffect
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

# Recommendation: Keep signals lowercase in GDScript convention (e.g., signal collected)
# If you change it to lowercase here, change 'pineapple.Collected' to 'pineapple.collected' in Level1.
signal Collected

func _ready() -> void:
	pass

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass

@warning_ignore("unused_parameter")
func _on_body_entered(body: Node2D) -> void:
	animated_sprite_2d.animation = "Collected"
	collectedsoundeffect.play()
	Collected.emit()
	
	call_deferred("_disable_collision")

func _disable_collision() -> void:
	collision_shape_2d.disabled = true
	
	# BUG PREVENTION: Make sure to remove the pineapple collision or free the node 
	# so the player can't trigger '_on_body_entered' multiple times for the same item.
	# queue_free() # Un-comment this line if you want the pineapple to disappear entirely.


func _on_animated_sprite_2d_animation_looped() -> void:
	if animated_sprite_2d.animation == "Collected":
		queue_free()
	
