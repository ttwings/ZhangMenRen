extends Thing
class_name Item

signal onSetNum()

var price = 4000
var num = 1 setget setNum

func setNum(val):
	num = val
	emit_signal("onSetNum")
