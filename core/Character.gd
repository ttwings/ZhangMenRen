extends Node2D

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


# 队伍
@export var team = 1:
	set(v):
		team = v
		emit_signal("on_changed_team", team)
	get:
		return team


# 移动速度
var move_speed = 300

var spr = $spr
var anim = $AnimationPlayer
var normal_spr = $spr/normal
var atk_box = null
var paused_timer = $ex/PausedTimer

var now_anim = ""
var now_time = 0
var atk_info = AtkInfo.new()
var def_status = 0 # 0:普通 1:无敌 2:霸体 3:防御
var atking = false

# 技能列表
var skills = []
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
# 进化列表
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
var att_base = Att.new()
# 基础属性
var att = Att.new()
# 附加属性
var att_add = Att.new()



Class Skill:
	var id = ""
	var now_time = 0
	var cd = 0

func _init():
	masCha = self

func _ready():
	add_child(timer)
	set_team(team)
	set_move_speed(move_speed)
	add_to_group("Chara")
	add_att(att)
	add_att(att_add)

# 添加属性
func add_att(att):
	if att != null:
		atts.append(att)
		att.connect("on_changed", self, "change_att")



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
	
# 删除装备以外所有buff
func remove_all_buffs():
	for i in range(buffs.size()-1,-1,-1):
		if buffs.size() == 0:break
		var b = buffs[i]
		if b !(b is Item):
			remove_buff(b)

# 添加装备
func add_item(item):
	if item is Item and items.siez()<3:
		

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
			sys.battle.emit_signal("on_chara_cast_cd_skill", s.id)
			_cast_chara_cast_cd_skill(self,s.id)
			new_eff("xu_li").set_normal_pos(sprite_center)

# 死亡    
func death():
	is_dead = true
	set_process(false)
	set_physics_process(false)

# 删除角色
func remove():
	if is_dead:
		# 删除所有buff

# 发射子弹，子弹有速度、数量、角度、间隔、是否跟踪、是否穿透、等属性
