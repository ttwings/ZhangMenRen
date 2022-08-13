extends Actor
class_name Hero

var race: Race

var inputs = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}            


func _unhandled_input(event):
	if tween.is_active():
		return
	if hp_action == null:
		for dir in inputs.keys():
			if event.is_action_pressed(dir):
				var action = WalkAction.new()
				action.actor = self
				action.direction = inputs[dir]
				hp_action = action
				hp_action.execute()
				hp_action = null
				
#				if battle_field.locations[cell+dir] and battle_field.locations[cell+dir].actor:
#					var action = AttackAction.new()
#					action.actor = self
#					action.target = battle_field.locations[cell+dir].actor
#					hp_action = action
#				else:
#					var action = WalkAction.new()
#					action.actor = self
#					action.direction = inputs[dir]
#					hp_action = action
#					# select_hp_action()
				pass
