extends Action
class_name WalkAction

var direction = Vector2(0, 0)
var speed = 3
var tile_size = 64

func _execute():
	move(direction)

func move(_dir):
	var target = actor.position + _dir
	if battle_field.get_location(_dir) and battle_field.get_location(_dir).actor:
		var actor = battle_field.get_location(_dir).actor
		if actor is Monster:
			print("attack")
	else:
		move_tween(_dir)
		
func move_tween(_dir):
	actor.tween.interpolate_property(actor, "position",
	actor.position, actor.position + _dir * tile_size,1.0/speed, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	actor.tween.start()
