extends Node

# confused

func readom_step():
	var UP = randi()%2
	var DOWN = randi()%2
	var LEFT = randi()%2
	var RIGHT = randi()%2
	var dir = Vector2(RIGHT-LEFT, DOWN-UP)
	owner.setp(dir)

# 拾取  --- 摄取 一定范围物品  ，或者定点物品
func Grab():
	pass

# 吸取灵气，将物品上的灵气化为自己用，吸收效率不超 100%
# absorb
func Absorb():
	pass
	
# 开关
func Switch():
	pass

# 不触发效果，把物品放下
func Drop():
	pass
	
# 安装物品，比如安装法阵（设置陷阱），安装灵石（激活传送门）
# 安装炼丹炉（激活炼丹效果，且对安置点有要求）
# 安装药草，可以种植药草。 药草效率由年份决定。 药草有最大年份限制
func Setup():
	pass	
	
# 投掷 符纸 触发符纸效果。 
# 投掷 武器 触发武器效果，如 飞剑、枪
func Throw():
	pass
