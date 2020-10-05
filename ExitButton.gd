extends TextureButton

var attempts = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = "Exit"
	$Label.uppercase = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _quit():
	get_tree().quit()

func _on_ExitButton_button_up():
	
	$SFX2.play()
	
	attempts += 1
	
	var dialog = $AcceptDialog
	
	dialog.dialog_text = "¿Estás seguro de que quieres cerrar el juego?"
	
	if(attempts == 1):	
		dialog.add_cancel("Cancelar")
		
	dialog.popup()

func _on_AcceptDialog_confirmed():
	_quit()
