extends Actor
class_name Monster

# race is Race
export(Resource) var race
# 角色名称
export(String) var alias
# 玩家名称
export(String) var character_name
# 设置基本属性，肉身HP，灵力MP，神识AP
export(int) var Hp = 0
export(int) var Mp = 0
export(int) var Ap = 0
export(int) var Hp_max = 0
export(int) var Mp_max = 0
export(int) var Ap_max = 0
export(int) var Hp_temp = 0
export(int) var Mp_temp = 0
export(int) var Ap_temp = 0
# 设置等级
export(int) var level = 0
# 设置经验值
export(int) var experience = 0

# 获得最大肉体值
func get_max_hp():
	var maxhp = 0
	if race and race is Race:
	   maxhp = int(rand_range(race.Hp_dice,level * race.Hp_dice))
	else:
		print("race is ",race)
		return maxhp
	return maxhp

# 获得最大灵力值
func get_max_mp():
	var maxmp = 0
	if race and race is Race:
		maxmp = int(rand_range(race.Hp_dice,level * race.Hp_dice))
	else:
		print("race is ",race)
		return maxmp
	return maxmp

# 获得最大神识值
func get_max_ap():
	var maxap = 0
	if race and race is Race:
		maxap = int(rand_range(race.Hp_dice,level * race.Hp_dice))
	else:
		print("race is ",race)
		return maxap
	return maxap
