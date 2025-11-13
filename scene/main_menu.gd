extends Control

@onready var start_button: Button = $VBoxContainer/StartButton
@onready var options_button: Button = $VBoxContainer/OptionsButton
@onready var ouit_button: Button = $VBoxContainer/OuitButton

func _ready():
	$VBoxContainer/StartButton.pressed.connect(_on_start_pressed)
	$VBoxContainer/OptionsButton.pressed.connect(_on_options_pressed)
	$VBoxContainer/OuitButton.pressed.connect(_on_quit_pressed)
	

#Start-Button
func _on_start_pressed(): 
	get_tree().change_scene_to_file("res://scene/world.tscn")

#Option-Button
func _on_options_pressed():
	print("Options button pressed") #Muss n

#Ouit-Button
func _on_quit_pressed():
	get_tree().quit()
