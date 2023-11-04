extends Node2D

var health = 100
var coolguy: String = "me"

var score: int = 5
var move_speed: float = 2.5
var game_over: bool = false
var country_name: String = "why"
var population: int = 9000000
var highest_altitude: float = 2452.53
var landlocked: bool = false



# Called when the node enters the scene tree for the first time.
func _ready():
	move_speed = 5.1
	print(move_speed)
	move_speed = move_speed * move_speed
	print(move_speed)
	move_speed * 2
	print(move_speed)
	move_speed = move_speed / 2
	print(move_speed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
