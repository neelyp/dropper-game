extends Node2D

var coin
var coinInstance
var score = 0

func init():
	coin = preload("res://coin.tscn")
	coinInstance = coin.instantiate()
	add_child(coinInstance)

	coinInstance.coin_collected.connect(self._on_coin_collected)
	coinInstance.hit_floor.connect(self._on_hit_floor)

func _ready():
	init()

func _on_coin_collected():
	print("collected")
	score += 1
	get_node("score").text = "Score: " + str(score)
	init()
	
func _on_hit_floor():
	print("hit floor")
	get_tree().change_scene_to_file("res://menu.tscn")	
