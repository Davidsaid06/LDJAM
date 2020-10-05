extends TextureButton
#dictionary
var scenes = {
	"PlayButton": preload("res://lightingtest.tscn")
}


func _ready():
	$Label.text = "Play"
	$Label.uppercase = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _play():
	get_tree().change_scene_to(scenes[get_name()])

func _on_PlayButton_button_up():
	_play()
