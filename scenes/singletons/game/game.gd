class_name Game
extends Node
## Root node of the game


## Singleton Reference of the root game
static var ref: Game

## Singleton Constructor
func _init() -> void:
	if not ref:
		ref = self
	else: 
		queue_free()

const PATH:String = "user://tableforglobules.tres"
## Load in global data:
var data:Data = load_data()

func save_data() -> void:
	ResourceSaver.save(data,PATH)

func _exit_tree() -> void:
	save_data()

func load_data() -> Data:
	if ResourceLoader.exists(PATH):
		return load(PATH)
	else: 
		return Data.new()
