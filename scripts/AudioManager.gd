extends Node
#globales Audio-Skript
#Ist im Autoload (Project Settings --> Globals) 
	#Das Script ist dadurch immer da und überal erreichbar

var music_player: AudioStreamPlayer
var music_volume: float = -20.0 

func set_music_player(player: AudioStreamPlayer):
	music_player = player 
	music_player.volume_db = music_volume 


func set_volume(value):
	music_volume = value 
	if music_player:
		music_player.volume_db = value 
	save_volume()

func save_volume():
	var config = ConfigFile.new()
	config.set_value("audio", "music_volume", music_volume)
	config.save("user://settings.cfg")

func load_volume():
	var config = ConfigFile.new()
	if config.load("user://settings.cfg") == OK:
		music_volume = config.get_value("audio", "music_volume", 0.0)
