extends Thing
class_name Actor
# view node is ActorV

# Race
var race = Race

# 目标格子
var target_cell = Vector2(0, 0)
# 当前移动方向
var direction = Vector2(0, 0)
# 当前肉体行动能量，控制肌体的能量
var current_hp_energy = 0.0
# 当前灵力行动能量，控制体内灵力的能量
var current_mp_energy = 0.0
# 当前神识行动能量，控制调动大脑思考，神识外放的能量
var current_ap_energy = 0.0

# 肉体能量回复速度，每回合回复的量
var hp_recover_speed = 1
# 灵力能量回复速度
var mp_recover_speed = 1
# 神识能量回复速度
var ap_recover_speed = 1

# 肉体动作、灵力动作、神识动作
var hp_action = null
var mp_action = null
var ap_action = null

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

# 当前buff
var buffs = {}

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
	
# 获得生命比值
func get_hurt_state():
	var diff = (self.Hp * 1.0) / (self.Hp_max * 1.0)
	if diff >= 1.0 : 	return 0
	elif diff >= 0.9 : 	return 1
	elif diff >= 0.75 : return 2
	elif diff >= 0.5 : 	return 3
	elif diff >= 0.25 : return 4
	elif diff >= 0.1 : 	return 5
	else:				return 6



# 伤害
func hurt(actor,attack_value,attack_type,source):
	if source == null:
		source = self
	var attack_info = AttackInfo.new()
	attack_info.attack_value = attack_value
	attack_info.attack_type = attack_type
	attack_info.source = source
	attack_info.target = actor
	attack_info.attack_actor = self
	return hurt_base(attack_info)

func hurt_base(attack_info):
	if attack_info.attack_target == null or attack_info.attack_target.is_death:
		return
	attack_info.attack_actor.emit_signal("on_cast_hurt_start", attack_info)
