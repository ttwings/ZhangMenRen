extends Area3D

# 角色的显示对象
class_name CharaV

signal chara_changed(cha)

# 当改变队伍时，触发此信号
signal on_changed_team(team)
# 当承受攻击前，触发此信号
signal on_attack_start(atk)
signal on_attack(atk)
# 当承受伤害后，触发此信号
signal on_hurt_start(atk)
signal on_hurt(atk)
# 当回复生命时，触发此信号
signal on_recovery_hp(v)
# 当死亡降临前，触发此信号
signal on_death_fall(atk)
# 当死亡降临后，触发此信号
signal on_death(atk)
# 当对单位造成伤害后，触发此信号
signal on_damage(atk)
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
signal on_remove(chara)
# 当召唤生物时，触发此信号
signal on_summon(chara)

@onready var sprite = $Sprite3D
@onready var anim = $AnimationPlayer
@onready var effek = $EffekseerEmitter3D
@onready var ying = $Ying

var chara:Chara

func init(obj):
	chara = obj
	self.chara.connect("on_hurt",hurt)

func set_chara(cha:Chara):
	emit_signal("chara_change",cha)
	chara = cha
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# 当角色承受伤害时触发此函数
func hurt():
	anim.play("hurt")
	await anim.animation_finished
	pass	

# 当角色死亡时触发此函数
func death():
	anim.play("death")
	await anim.animation_finished
	pass
# 当角色攻击时触发此函数
func attack():
	anim.play("attack")
	await anim.animation_finished
	pass
