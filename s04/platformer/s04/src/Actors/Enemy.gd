extends "res://src/Actors/Actor.gd"


func _ready() -> void:
	velocity.x = -speed.x
	
func _on_StompDetector_body_entered(body: PhysicsBody2D) -> void:
	print("stomp detected")
	if body.global_position.y > get_node("StompDetector").global_position.y:
		return
	queue_free()


func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	if is_on_wall():
		velocity.x *= -1.0
	velocity.y = move_and_slide(velocity, floor_normal).y


