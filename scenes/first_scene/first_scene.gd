class_name FirstScene
extends Control
## The first scene created in this project

## idleons owned by the Player
var idleons: int = 0

## how quickly idleons increase with button press
var growth_rate: int = 5

func _ready() -> void:
	update_label()
	(get_node("Button") as Button).pressed.connect(_on_button_pressed)
	
func _on_button_pressed() -> void:
	update_idleons(growth_rate)
	update_label()

func update_idleons(x: int) -> void:
	idleons += x
	
func update_label() -> void:
	(get_node("IdleonsLabel") as Label).text = "Idleons: %s" %idleons
