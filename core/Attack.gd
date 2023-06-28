class_name Attack

## 伤害值
var hurt_value := 0

## 伤害类型 物理、法术、精神
enum HurtType {
	PHYSICAL,
	MAGICAL,
	MENTAL
}

var hurt_type = HurtType.PHYSICAL
## 攻击值，可以当作命中来对待，与def起作用。
var attack_value := 0
## 攻击类型 普通、bullet、技能、debuff、其他、失误
enum AttackType {
	NORMAL,
	BULLET,
	SKILL,
	DEBUFF,
	OTHER,
	MISS
}

var attack_type = AttackType.NORMAL
## 攻击者
var attacker :Obj = null
