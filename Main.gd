extends Node

# Declare member variables here. Examples:
export (PackedScene) var Mob
var score

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func Game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	
func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()


func _on_StartTimer_timeout():
	$MobPath.start()
	$ScoreTimer.start()
	

func _on_ScoreTimer_timeout():
	score += 1	


func _on_MobTimer_timeout():
	$MobPath/MobSpawnLocation.set_offset(randi())
	var mob = Mob.instance()
	add_child(mob)
	
	var direction = $MobPath/MobSpawnLocation.rotation + PI/2
	
	mob.position = $MobPath/MobSpawnLocation.position
	direction += rand_range(-PI /4, PI /4)
	mob.rotation = direction
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

