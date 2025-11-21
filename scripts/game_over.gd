extends Control

@onready var retry_button: Button = $VBoxContainer/RetryButton
@onready var main_menu_button: Button = $VBoxContainer/MainMenuButton
@onready var quit_button: Button = $VBoxContainer/QuitButton




func _ready() -> void:
	get_tree().paused = true #Stoppt das ganze Spiel sobald dieser Screen erscheint

#Buttons mit den funktionen verbinden
	retry_button.pressed.connect(_on_retry_pressed)
	main_menu_button.pressed.connect(_on_mainmenu_pressed)
	quit_button.pressed.connect(_on_quit_pressed)

func _on_retry_pressed():
	get_tree().paused = false #pausierung aufheben
	get_tree().reload_current_scene() #lädt die szene neu/Neu start


func _on_mainmenu_pressed():
	get_tree().paused = false #pausierung aufheben
	get_tree().change_scene_to_file("res://scene/main_menu.tscn") #zurück ins Hauptmenü


func _on_quit_pressed():
	get_tree().quit() #Spiel komplett beenden
