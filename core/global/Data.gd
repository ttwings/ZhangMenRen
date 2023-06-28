## 新资源
func new_res(id):
	pass

## 新效果
func new_eff(id):
	var dir = "effects"
	var suffix = "gd"
	var path = "{dir}/{id}.{suffix}"
	var eff = load(path)
	return eff 

## 新buff
func new_buff(id):
	var dir = "buffs"
	var suffix = "gd"
	var path = "{dir}/{id}.{suffix}"
	var buff = load(path)
	return buff 

## 新技能
func new_skill(id):
	var dir = "skills"
	var suffix = "gd"
	var path = "{dir}/{id}.{suffix}"
	var skill = load(path)
	return skill

## 新物品
func new_item(id):
	var dir = "items"
	var suffix = "gd"
	var path = "{dir}/{id}.{suffix}"
	var item = load(path)
	return item	

## 新怪物
func new_monster(id):
	var dir = "monsters"
	var suffix = "gd"
	var path = "{dir}/{id}.{suffix}"
	var monster = load(path)
	return monster

## 新地图
func new_map(id):
	var dir = "maps"
	var suffix = "gd"
	var path = "{dir}/{id}.{suffix}"
	var map = load(path)
	return map	
