extends KinematicBody2D


export var Velocidad : = 50.0
export var Distancia = 170
onready var nav_2d : Navigation2D = $"../Navigation2D"
onready var interruptores = get_tree().get_nodes_in_group("interruptores")
var path : = PoolVector2Array()
var currentInterruptor = null
var rng = RandomNumberGenerator.new()
var Direccion = 0

func _ready():
	SelectInrretupor()

func SelectInrretupor():
	rng.randomize()
	var indice = rng.randi_range(0,len(interruptores) - 1)
	var tmpcurrentInterruptor = interruptores[indice]
	while(tmpcurrentInterruptor == currentInterruptor):
		rng.randomize()
		indice = rng.randi_range(0,len(interruptores) - 1)
		tmpcurrentInterruptor = interruptores[indice]
	currentInterruptor = tmpcurrentInterruptor
func moveToPath(posA, posB,distance):
	path = nav_2d.get_simple_path(posA,posB,false)
	
	if(path.size() == 0):
		pass
	var start_point := position
	for i in range(path.size()):
		var distance_to_next := start_point.distance_to(path[0])
		if(distance <= distance_to_next and distance >= 0.0):
			var viejaPos = position.x
			position = start_point.linear_interpolate(path[0],distance / distance_to_next)
			if viejaPos > position.x: 
				Direccion = 0
			else: Direccion = 1
			#move_and_slide(Vector2(0,0))
			break
		elif distance < 0.0:
			position = path[0]
			break
		distance -= distance_to_next
		start_point = path[0]
		path.remove(0)

func _physics_process(delta : float):
	var posicionPlayer = $"../MenuPlayer".position
	var distanciaActual = sqrt(pow(posicionPlayer.x - position.x,2) + pow(posicionPlayer.y - position.y, 2))

	var distance : = Velocidad * delta
	if distanciaActual < Distancia:
		# Si el asesino encuentra al jugador
		distance = (Velocidad + 15) * delta
		moveToPath(position,posicionPlayer,distance)
		print(distanciaActual)
	
	else:
		moveToPath(position,currentInterruptor.position,distance)
	
	if Direccion > 0:
		$AnimatedSprite.play("derecha_anim")
	else: $AnimatedSprite.play("izquierda_anim")
