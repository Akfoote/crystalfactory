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

## Load in global data:
var data:Data = Data.new()
