extends Node2D


func get_base_texture(path:NodePath):
	var texture:Texture
	if has_node(path) and get_node(path) is Sprite:
		texture = get_node(path).texture
	else:
		print_debug("未找到纹理资源")
		texture = load("res://icon.png")
	return texture
