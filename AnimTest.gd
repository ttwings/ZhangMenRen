extends Node2D

func _ready():
	Anima.begin(self)\
	.then(Anima.Node(get_node("Sprite")).anima_position_x(640,3))\
	.play()


# 玩家节点向地图节点发送移动信号
# 地图节点控制玩家节点移动
# 移动完成后，玩家节点坐标变化
