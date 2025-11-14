extends Control

@onready var start_button: Button = $MainPanel/VBoxContainer/StartButton
@onready var options_button: Button = $MainPanel/VBoxContainer/OptionsButton
@onready var ouit_button: Button = $MainPanel/VBoxContainer/OuitButton
@onready var menu_music: AudioStreamPlayer = $MenuMusic

@onready var main_panel: Control = $MainPanel
@onready var option_panel: Control = $OptionPanel


@onready var music_slider: HSlider = $OptionPanel/VBoxContainer/MusicSlider
@onready var back_button: Button = $OptionPanel/VBoxContainer/BackButton


func _ready():
	$MainPanel/VBoxContainer/StartButton.pressed.connect(_on_start_pressed)
	$MainPanel/VBoxContainer/OptionsButton.pressed.connect(_on_options_pressed)
	$MainPanel/VBoxContainer/OuitButton.pressed.connect(_on_quit_pressed)

	# Musik-Player an AudioManager übergeben
	AudioManager.set_music_player(menu_music)
	AudioManager.load_volume()
	menu_music.volume_db = AudioManager.music_volume

	# Hauptmenü zeigt MainPanel
	main_panel.visible = true
	option_panel.visible = false

	# Optionen verbinden
	music_slider.value = AudioManager.music_volume
	music_slider.value_changed.connect(_on_volume_changed)
	back_button.pressed.connect(_on_back_pressed)

#Start-Button
func _on_start_pressed(): 
	menu_music.stop() #Menu Musik hört auf
	get_tree().change_scene_to_file("res://scene/world.tscn")

#Option-Button
func _on_options_pressed():
	# MainPanel verstecken, OptionsPanel zeigen
	main_panel.visible = false
	option_panel.visible = true

#Ouit-Button
func _on_quit_pressed():
	get_tree().quit()

func _on_volume_changed(value):
	AudioManager.set_volume(value)

func _on_back_pressed():
	# zurück zum Hauptmenü
	main_panel.visible = true
	option_panel.visible = false
