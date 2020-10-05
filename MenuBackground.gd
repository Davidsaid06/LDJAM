extends Node2D

var interruptoresArreglados = []

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var tmp_interruptor = get_tree().get_nodes_in_group("interruptores")
	for i in tmp_interruptor:
		#interruptoresArreglados.push_back(false)
		interruptoresArreglados.push_back(i)
	pass

func checkInterruptoresListos():
	for v in interruptoresArreglados:
		if(v.isOn == false):
			return false
			break
	return true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(checkInterruptoresListos() == true):
		print("abre la puerta")
		get_node("PuertaDeSalida").visible= true
		set_process(false)
	pass

func _on_PuertaDeSalida_body_entered(body):
	if checkInterruptoresListos():
		print("Nivel Reiniciado")
		get_tree().reload_current_scene()
	pass # Replace with function body.
