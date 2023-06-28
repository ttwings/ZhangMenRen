extends Node2D
# 战场类
class_name Battlefield
# 信号 当战斗开始时
signal on_battle_start()
# 战斗结束
signal on_battle_end()
# 当有角色死亡时
signal on_chara_dead(cha,id)
# 当有角色释放技能时
signal on_chara_cast_skill(cha,id,skill_id)

# 天气类
var weather : Weather
# 地图
var map:TileMap
var tileszie = 64
# 矩阵
var mat = []
var mat_h = 6
var mat_w = 10

# 角色池
var charas = []
var size = Vector2(40,30)
var locations = {}
# 玩家
var player

func _ready():

	pass

func _process(delta):
	pass	
	
# 战斗开始
func battle_start():
	pass

# 战斗更新
func battle_process(delta):
	for cha in charas.size():
		cha.process(delta)


# 战斗结束
func battle_end():
	pass

# 战斗结算
func battle_completed():
	pass
