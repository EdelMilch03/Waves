extends Area2D

@onready var collision_shape: CollisionShape2D = $CollisionShape2D


func _ready() -> void:
	body_entered.connect(_on_body_entered) 



func _on_body_entered(body):
	if body.name == "Player":
		body.die()
