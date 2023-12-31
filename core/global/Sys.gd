extends Node

## COLORS  同时准备作为等级颜色。 
const COLOR_RED = "#D04648"		## 炼虚 6
const COLOR_ORANGE = "#FF9C2A"	## 化神 5
const COLOR_GREEN = "#4CD964"	## 元婴 4
const COLOR_YELLOW = "#FFCC29"	## 金丹 3
const COLOR_CYAN = "#5AC8FA"	## 筑基 2
const COLOR_BLUE = "#4B77BE"	## 练气 1
const COLOR_PURPLE = "#8E44AD"  ## 任务品
const COLOR_WHITE = "#ECF0F1"	## 普通 0
const COLOR_GRAY = "#95A5A6"	## 受损 -1

const COLOR_LIGHT_BLUE = "#5AC8FA"
const COLOR_LIGHT_GREEN = "#4CD964"
const COLOR_BLACK = "#34495E"


# Z index,用来控制显示层次
const LAYER_DECAL = 0
const LAYER_ITEM = 1
const LAYER_ACTOR = 2
const LAYER_FX = 3

# game variables
var game
var player
## 场景
var scene
var inventory
var temp_action

func _ready():
#	player = Chara.new()
	pass

# broadcast status messages
func broadcast(message,color = COLOR_BLUE) :
	if game:
		if game.messagebox:
			game.messagebox.append_bbcode("[color=" + color + "]" + message + "[/color]")
			game.messagebox.newline()

# clear the game status message
func clear_message() :
	if game:
		if game.messagebox:
			game.messagebox.clear()

# 在l,h范围roll一个随机数
func roll(l,h):
	return randi() % (h-l+1) + l


## 创建一个新的信息框
func new_message(file="",txt=""):
	var dialog = load(file).instantiate()
	main.ui.add_child(dialog)
	dialog.text = txt
	dialog.popup_centered()
	return dialog
	pass




## 创建一个新的对话框
func new_dialog(file="",txt=""):
	var dialog = load(file).instantiate()
	main.ui.add_child(dialog)
	dialog.text = txt
	dialog.popup_centered()
	return dialog

