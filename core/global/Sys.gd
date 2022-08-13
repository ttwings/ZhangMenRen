extends Node
class_name Sys

var main :Main 
var game :Game

func _ready():
	OS.window_size *= 2
	OS.center_window()

# 创建一个新的信息框
func new_message(file="",txt=""):
	var msg = load(file).instance()
	main.ui.add_child(msg)
	msg.text = txt
	msg.popup_centered()

# 创建一个新的对话框
func new_dialog(file="",txt=""):
	var dialog = load(file).instance()
	main.ui.add_child(dialog)
	dialog.text = txt
	dialog.popup_centered()
	return dialog

