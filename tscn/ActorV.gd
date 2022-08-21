extends ThingV
class_name ActorV
# Class Actor view node

var actor

func init(t):
	.init(t)
	actor = t

func add_tip(bbc):
	tip.bbcode_enabled = true
	tip.bbcode_text = bbc
