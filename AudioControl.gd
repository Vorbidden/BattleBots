extends AudioStreamPlayer

func music_playing(music: AudioStream):
	return stream == music
	
func play_music(music: AudioStream, volume = 0.0):
	stream = music
	volume_db = volume
	play()
	
func stop_music():
	stop()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
