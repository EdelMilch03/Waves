extends Control

@onready var start_button: Button = $MainPanel/VBoxContainer/StartButton
@onready var options_button: Button = $MainPanel/VBoxContainer/OptionsButton
@onready var ouit_button: Button = $MainPanel/VBoxContainer/OuitButton


func _ready():
	$MainPanel/VBoxContainer/StartButton.pressed.connect(_on_start_pressed)
	$MainPanel/VBoxContainer/OptionsButton.pressed.connect(_on_options_pressed)
	$MainPanel/VBoxContainer/OuitButton.pressed.connect(_on_quit_pressed)
	

#Start-Button
func _on_start_pressed(): 
	get_tree().change_scene_to_file("res://scene/world.tscn")

#Option-Button
func _on_options_pressed():
	print("Options button pressed") #Muss n

#Ouit-Button
func _on_quit_pressed():
	get_tree().quit()
