extends Node
class_name Base

# 添加附加物时
signal on_add_append(base)
# 移除附加物时
signal on_remove_append(base)
# 移动自己时
signal on_move_to(base)
# 删除时
signal on_delete()
# 数据变化时
signal on_dbase_change(key,value)

# sid
@export var sid := "":
	set(v):
		sid = v
		dbase["sid"] = v
		emit_signal("on_dbase_change","sid",v)
	get:
		return sid

# 别名
@export var alias := "":
	set(v):
		alias = v
		dbase["alias"] = v
		emit_signal("on_dbase_change","alias",v)
	get:
		return alias

# 描述long
@export var long := "":
	set(v):
		long = v
		dbase["long"] = v
		emit_signal("on_dbase_change","long",v)
	get:
		return long

# 附加物 可以是 物品、技能、房间等
var appends = {}

# 其他object容器，objects，用来存储路径
var objects = {}

# 数据容器
@export var dbase := {}

# 临时数据容器
@export var temp_dbase := {}

# 状态容器
@export var condition := {}

# 持有者
var master:Base = null

# 移动到另一个数据容器中
func move_to(base:Base):
	self.owner = base
	base.add_append(self)
	emit_signal("on_move_to",base)

# 添加附属物
func add_append(base:Base):
	if appends.has(base) :return base
	appends[base.id] = base
	# 节点添加到树中
	add_child(base)
	base.owner = self
	emit_signal("on_add_append",base)
	return base

# 删除附属物
func del_append(base:Base):
	if appends.has(base):
		appends.erase(base)
		emit_signal("on_remove_append",base)
		base.emit_signal("on_delete")
		base.owner = null
	return base

# 查找目标id的append
func query_append(id:String):
	for base in appends:
		if base.id == id:
			return base
	return null

# 判断是否含有目标id的append
func has_append(id:String):
	for base in appends:
		if base.id == id:
			return true
	return false

# 删除自己
func delete():
	emit_signal("on_delete")
	master.del_append(self)
	self.owner = null
	return self

# query 查询值，如果不存在这个key，则返回0
func query(key):
	if dbase.has(key):
		return dbase[key]
	return 0

# 设置值
func set(key,value):
	dbase[key] = value
	emit_signal("on_dbase_change",key,value)	

# 增加值
func add(key,value):
	if dbase.has(key):
		dbase[key] += value
	else:
		dbase[key] = value
	emit_signal("on_dbase_change",key,dbase[key])

# 删除dbase的值，如果不存在这个key，则返回false
func del(key):
	if dbase.has(key):
		dbase.erase(key)
		emit_signal("on_dbase_change",key,null)
		return true
	return false

# query 查询temp值，如果不存在这个key，则返回0
func query_temp(key):
	if temp_dbase.has(key):
		return temp_dbase[key]
	return 0

# 设置temp值
func set_temp(key,value):
	temp_dbase[key] = value	

# 增加temp值
func add_temp(key,value):
	if temp_dbase.has(key):
		temp_dbase[key] += value
	else:
		temp_dbase[key] = value

# 删除temp的值，如果不存在这个key，则返回false
func del_temp(key):
	if temp_dbase.has(key):
		temp_dbase.erase(key)
		return true
	return false

# query 查询condition值，如果不存在这个key，则返回0
func query_condition(key):
	if condition.has(key):
		return condition[key]
	return 0

# 设置condition值
func set_condition(key,value):
	condition[key] = value

# 增加condition值
func add_condition(key,value):
	if condition.has(key):
		condition[key] += value
	else:
		condition[key] = value

# 添加object到objects中
func add_object(path:String, amount:int = 1):
	objects[path] = obj

# 加载场景对象
func query_object(path:String):
	"""
	查找相对路径下的场景对象
	:param path: 相对路径
	:return: 场景对象
	"""
	var scene = load("res://" + path + ".tscn")
	if scene:
		var obj = scene.instance()
		return obj
	return null



