extend Buff
# 场地类
class_name Field
# 场地可以用来建筑如练功房、炼器房。可以用来种植，如灵田、灵池、灵窝
# 场地可以为在其中的角色提供各类buff
# 以下为场地类的信号
signal character_entered_field(character) # 角色进入场地
signal monster_entered_field(monster) # 怪物进入场地
signal character_attacked(target) # 角色攻击目标
signal character_used_skill(skill) # 角色使用技能
signal character_used_item(item) # 角色使用物品
signal character_escaped() # 角色逃跑
signal monster_attacked(target) # 怪物攻击目标
signal monster_used_skill(skill) # 怪物使用技能
signal monster_used_item(item) # 怪物使用物品
signal monster_escaped() # 怪物逃跑
signal buff_added(buff) # 添加buff
signal buff_removed(buff) # 移除buff

var buffs = [] # buff列表

func add_buff(buff): # 添加buff
    buffs.append(buff)
    emit_signal("buff_added", buff)

func remove_buff(buff): # 移除buff
    buffs.erase(buff)
    emit_signal("buff_removed", buff)

func apply_buffs(character): # 应用buff
    for buff in buffs:
        buff.apply(character)

func on_character_entered_field(character):
    emit_signal("character_entered_field", character)

func on_monster_entered_field(monster):
    emit_signal("monster_entered_field", monster)

func on_character_attacked(target):
    emit_signal("character_attacked", target)

func on_character_used_skill(skill):
    emit_signal("character_used_skill", skill)

func on_character_used_item(item):
    emit_signal("character_used_item", item)

func on_character_escaped():
    emit_signal("character_escaped")

func on_monster_attacked(target):
    emit_signal("monster_attacked", target)

func on_monster_used_skill(skill):
    emit_signal("monster_used_skill", skill)

func on_monster_used_item(item):
    emit_signal("monster_used_item", item)

func on_monster_escaped():
    emit_signal("monster_escaped")

