extends Button

signal unit_pressed(unit_name)

@export var unit_name: String = "Unnamed"
var equipped = false
# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = unit_name

func equip():
	pass

func _pressed():
	print(unit_name)
	unit_pressed.emit(unit_name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
