extends Obj

class_name Chara

# 当改变队伍时，触发此信号
signal on_changed_team(team)
# 当承受攻击前，触发此信号
signal on_attack_before(atk_info)
signal on_attack_info(atk_info)
# 当承受伤害后，触发此信号
signal on_hurt(atk_info)
signal on_hurt_end(atk_info)
# 当回复生命时，触发此信号
signal on_recovery_hp(v)
# 当死亡降临前，触发此信号
signal on_death_fall(atk_info)
# 当死亡降临后，触发此信号
signal on_death(atk_info)
# 当对单位造成伤害后，触发此信号
signal on_damage(atk_info)
# 当改变队伍时，触发此信号
signal on_change_team(team)
# 当添加道具时，触发此信号
signal on_add_item(item)
# 当移除道具时，触发此信号
signal on_remove_item(item)
# 当释放技能时，触发此信号
signal on_skill(skill)
# 当添加buff时，触发此信号
signal on_add_buff(buff)
# 当移除buff时，触发此信号
signal on_remove_buff(buff)
# 当被删除时，触发此信号
signal on_remove(character)
# 当召唤生物时，触发此信号
signal on_summon(actor)
## 当等级增加时，触发此信号
signal on_plus_lv(lv)
## 当经验值增加时，触发此信号
signal on_plus_xp(xp)


# 移动速度
var move_speed = 300
# 攻击中
var atking = false

# 技能列表
var skills = []
## 动作列表
var actions = []

# buff列表
var buffs = []
# 物品列表
var items = []
# 是否移动中
var is_moving = false
# 是否死亡
var is_dead = false
# 是否是召唤物
var is_summon = false
# 是否进化
var is_evolution = false
# 精灵中心
var sprite_center = Vector2()
# 目录位置
var direc = ""
# 变化列表
var evolutions = []
# 技能名称列表
var skill_names = []
# 普通攻击效果id
var normal_atk_id = 0
# 单位等级
var level = 0
# 呈现的最终属性
var att_final = Att.new()
#  基点属性
#var att_base = Att.new()
# 基础属性
var att = Att.new()
# 附加属性
var att_add = Att.new()



func _init():
	master = self

func _ready():
	add_att(att)
	add_att(att_add)

# 添加属性
func add_att(att):
	if att != null:
		atts.append(att)
		att.connect("on_changed", self, "change_att")

# 添加buff
func add_buff(id):
	var bf = sys.new_buff(id)
	if has_buff(id):
		buffs[id].level = bf.level

# 查找是否有目标ID的buff
func has_buff(id):
	for b in buffs:
		if b.id == id:
			return b
	return null

# 删除buff
func remove_buff(buff):
	if buff != null:
		buffs.erase(buff)
		if buff.att != null:
			remove_att(buff.att)
		buff.remove()
# 删除属性
func remove_att(att):
	pass
	
# 删除装备以外所有buff
func remove_all_buffs():
	for i in range(buffs.size()-1,-1,-1):
		if buffs.size() == 0:break
		var b = buffs[i]
		if not (b is Item):
			remove_buff(b)


# 技能列表中添加cd型技能
func add_cd_skill(id,cd):
	var skill = Skill.new()
	skill.id = id
	skill.now_time = 0
	skill.cd = cd
	skills.append(skill)

# 释放技能
func _cast_cd_skill(id):
	pass

# 获取目标技能信息
func get_skill(id):
	for s in skills:
		if s.id == id:
			return s
	return null



var time = 0.0
func _process(delta):
	# 更新buff
	for i in range(buffs.size()-1,-1,-1):
		var b = buffs[i]
		b.process(delta)
		if b.is_end:
			buffs.remove(i)
	
	# 更新技能
	for s in skills:
		if s.now_time >= s.cd:
			s.now_time = 0
			_cast_cd_skill(s.id)
			emit_signal("on_cast_cd_skill", s.id)
	# 更新动作
	for a in actions:
		if a.now_time >= a.cd:
			a.now_time = 0
			_cast_cd_skill(a.id)
			emit_signal("on_cast_cd_skill", a.id)

# 死亡    
func death():
	is_dead = true

## 受伤
func hurt(attack:Attack):
	# 如果攻击的伤害类型是物理伤害
	if attack.hurt_type == HurtType.PHYSICAL:
		var def = att_final.h_def
		var hurt = attack.hurt - def
		if hurt < 0:
			hurt = 0
		att.hp = att.hp - hurt < 0 ? 0 : att.hp - hurt
		emit_signal("on_hurt", attack)
	# 如果攻击的伤害类型是魔法伤害
	elif attack.hurt_type == HurtType.MAGIC:
		var def = att_final.m_def
		var hurt = attack.hurt - def
		if hurt < 0:
			hurt = 0
		att.hp = att.hp - hurt < 0 ? 0 : att.hp - hurt
		emit_signal("on_hurt", attack)
	# 如果攻击的伤害类型是精神伤害
	elif attack.hurt_type == HurtType.SPIRIT:
		var def = att_final.a_def
		var hurt = attack.hurt - def
		if hurt < 0:
			hurt = 0
		att.hp = att.hp - hurt < 0 ? 0 : att.hp - hurt
		emit_signal("on_hurt", attack)
		
	# 当血量小于0时，触发死亡事件	
	if att.hp <= 0 or is_dead == false:
		is_dead = true
		att.hp = 0
		emit_signal("on_death")

	pass

## 执行buff
func cast_buff(cha,id,lv = 1):
	var old_buff = cha.has_append(id)
	if old_buff != null :
		old_buff.life_val = old_buff.life
		old_buff.lv += lv
		emit_signal("on_cast_buff",old_buff)
		emit_signal("on_add_buff",old_buff)
	else:
		var bf = data.new_buff(id)
		cha.add_append(bf)
		bf.lv = lv
		bf.life_val = bf.life
		bf.cast_char = self
		emit_signal("on_cast_buff",bf)
		emit_signal("on_add_buff",bf)
	
## 增加hp
func plus_hp(val,cha = null, is_eff = true):
	if cha == null:
		cha = self
	cha.hp += val
	if cha.hp > cha.max_hp:
		cha.hp = cha.max_hp
	if is_eff and is_instance_valid(scene):
		scene.new_eff("eff_回复", cha.position)
		emit_signal("on_cast_plus_hp",val,cha)
		cha.emit_signal("on_plus_hp",val,cha)
		if is_instance_valid(scene) == false : reutrn
		scene.emit_signal("on_cha_cast_plus_hp",self,val,cha)
		scene.emit_signal("on_cha_plus_hp",cha,val,self)


## 增加mp
func plus_mp(val,cha = null, is_eff = true):
	if cha == null:
		cha = self
	cha.mp += val
	if cha.mp > cha.max_mp:
		cha.mp = cha.max_mp
	if is_eff and is_instance_valid(scene):
		scene.new_eff("eff_回复", cha.position)
		emit_signal("on_cast_plus_mp",val,cha)
		cha.emit_signal("on_plus_mp",val,cha)
		if is_instance_valid(scene) == false : reutrn
		scene.emit_signal("on_cha_cast_plus_mp",self,val,cha)
		scene.emit_signal("on_cha_plus_mp",cha,val,self)


## 增加ap
func plus_ap(val,cha = null, is_eff = true):
	if cha == null:
		cha = self
	cha.ap += val
	if cha.ap > cha.max_ap:
		cha.ap = cha.max_ap
	if is_eff and is_instance_valid(scene):
		scene.new_eff("eff_回复", cha.position)
		emit_signal("on_cast_plus_ap",val,cha)
		cha.emit_signal("on_plus_ap",val,cha)
		if is_instance_valid(scene) == false : reutrn
		scene.emit_signal("on_cha_cast_plus_ap",self,val,cha)
		scene.emit_signal("on_cha_plus_ap",cha,val,self)

## 等级提升
func plus_lv(v):
	self.lv += v
	if self.lv > self.max_lv:
		self.lv = self.max_lv
	emit_signal("on_plus_lv",v)

## 技能熟练度函数
# 技能熟练度函数
var skill_proficiency = {}

# 添加技能
func add_skill(id):
	if id not in skill_proficiency:
		skill_proficiency[id] = 0
	if id not in skill_names:
		skill_names.append(id)

# 获取技能熟练度
func get_skill_proficiency(id):
	if id in skill_proficiency:
		return skill_proficiency[id]
	return 0

# 提升技能熟练度
func increase_skill_proficiency(id, val):
	if id in skill_proficiency:
		skill_proficiency[id] += val
	else:
		skill_proficiency[id] = val

# 获取所有技能名称
func get_skill_names():
	return skill_names
