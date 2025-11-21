extends CharacterBody2D



@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var JUMP_VELOCITY : int = -300

var SPEED : int = 300


func _ready():
	animated_sprite.play("idle")
	

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("Left", "Right")


	if direction:
		velocity.x = direction * SPEED
		animated_sprite.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY



	if not is_on_floor():
		velocity += get_gravity() * delta
		animated_sprite.play("jump")

	if direction == 0 and is_on_floor() :
		animated_sprite.play("idle")

	move_and_slide()
	_handle_direction(direction)

func _handle_direction(direction):
	if direction > 0 :
		animated_sprite.flip_h = false
	elif direction < 0 :
		animated_sprite.flip_h = true

func die():
	print ("player died")
	var game_over = load("res://scene/game_over.tscn").instantiate() #gameover-szene laden
	print("game over")
	get_tree().current_scene.add_child(game_over) #in die aktuelle szene einfügen
	get_tree().change_scene_to_file("res://scene/game_over.tscn")
