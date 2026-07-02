extends Area2D

@onready var timer: Timer = $Timer
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

@export var active_time: float = 5.0      # Wie lange die Falle an ist
@export var inactive_time: float = 60.0  # Wie lange sie aus ist


var is_active = true #Falle startet aktiv


func _ready() -> void:
	body_entered.connect(_on_body_entered) 
	timer.timeout.connect(_on_timer_timeout)

	_activate_trap() #Startzustand

func _on_body_entered(body):
	if not is_active: #Wenn falle aus ist passiert nix
		return


	if body.name == "Player":
		body.die()

func _activate_trap():
	is_active = true
	collision_shape.disabled = false      # Collision AN
	animated_sprite.play("activate")
	
	# Wenn activate-Animation fertig ist → idle spielen
	await animated_sprite.animation_finished
	animated_sprite.play("idle")
	timer.start(active_time)

	# Nach X Sekunden wieder deaktivieren
	timer.start(10.0)   # 5 Sekunden aktiv (änderbar)

func _deactivate_trap():
	is_active = false
	collision_shape.disabled = true       # Collision AUS

	animated_sprite.play("deactivate")

	await animated_sprite.animation_finished

	animated_sprite.play("stop")

	# Nach Y Sekunden wieder aktivieren
	timer.start(inactive_time)


func _on_timer_timeout():
	if is_active:
		_deactivate_trap()
	else:
		_activate_trap()
