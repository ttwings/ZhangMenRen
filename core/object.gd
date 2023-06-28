class_name object

## 数据表
var dbase = {
    name = "",
    long = "",
    hp = 0,
    mp = 0,
    ap = 0,
}
## 临时数据表, 
## hp_temp, mp_temp, ap_temp,来源于装备技能的加成，
## hp_cur, mp_cur, ap_cur,表示当前情况
## hp_hurt, mp_hurt, ap_hurt,表示受到的伤害
## hp_heal, mp_heal, ap_heal,表示受到的治疗
## hp_cur = hp + hp_temp + hp_heal - hp_hurt
## mp_cur = mp + mp_temp + mp_heal - mp_hurt
## ap_cur = ap + ap_temp + ap_heal - ap_hurt

var temp = {}
## 状态表
var condition = {}

## 设置数据函数
func set_data(key:String, value):
    dbase[key] = value

## 设置临时数据函数, 用于保存技能施加的临时值 或 施加的当前值 到 temp 中 或 从 temp 中获取 。 获取 temp 的功能是清除 temp 并将其用于
func set_temp(key:String, value):
    temp[key] = value

## 设置状态
func set_condition(key:String, value):
    condition[key] = value

## 从dbase中查询
func query(key):
    if key in dbase:
        return dbase[key]
    else:
        return 0

## 从temp中查询 
func query_temp(key):
    if key in temp:
        return temp[key]
    else:
        return 0

## 从condition中查询
func query_condition(key):
    if key in condition:
        return condition[key]
    else:
        return 0
