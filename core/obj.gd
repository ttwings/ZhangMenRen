extends Att

class_name Obj

signal on_anim_end(name)

signal on_hit(attack)
signal on_pause(bl) 

var m_pos = Vector3()
var mas_char = null
var now_anim = ""
var now_time = 0.0
var attack = Attack.new()
var def_status = 0
var attacking = false

enum HurtType{PHY,MGI,REL}
enum AttakcType{NORMAL,SKILL,EFFECT,MISS}
