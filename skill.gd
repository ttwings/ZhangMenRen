extends Node

@export var skills:Array
var learned := {}
var skill_map := {}
var skill_prepare :={}

func query_skills():
	return skills
func query_learned():
	return learned
# Called when the node enters the scene tree for the first time.
func _ready():
	if owner is Base and owner.has_node("Char"):
		pass
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
