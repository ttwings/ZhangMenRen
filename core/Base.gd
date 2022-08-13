class_name Base

# 添加附加物时
# 移除附加物时
signal on_add_append(base)
signal on_remove_append(base)
# 移动自己时
signal on_move_to(base)
# 删除时
signal on_delete()

var sid = ""
# 数据文件地址
var path = ""
var name = ""
var description = ""
# 持有者
var owner:Base = null
var lv = 1
# 标签
var tab = {}
# 质量或比重
var weight = 0
# 附加物 可以是 物品、技能、房间等
var appends = {}
# 移动到另一个数据容器中
func move_to(base:Base):
	self.owner = base
	base.add_append(self)
	emit_signal("on_move_to",base)

#添加附属物  属性，buff，天赋，技能，通用统一了
func add_append(base:Base):
	if appends.has(base) :return base
	appends.append(base.sid,base)
	emit_signal("on_add_append",base)
	return base
#删除附属物
func del_append(base:Base): 
	if appends.has(base):
		appends.erase(base)
		emit_signal("on_remove_append",base)
		base.emit_signal("on_delete")
		base.owner = null
	return base
	
#查找是否有目标id的append
func find_append(id:String):
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

#是否包含所有标签 tabs 可以是多个标签如“xxx xxx”
func has_all_tabs(tabs):
	var list = tabs.split(" ")
	var list2 = tab.split(" ")
	for i in list:
		var b = false
		for j in list2:
			if i == j :
				b = true
				continue
		if !b :return false
	return true
	
#是否包含其中一个 tabs 可以是多个标签如“xxx xxx”
func has_or_tabs(tabs):
	var list = tabs.split(" ")
	for i in list:
		if tab.find(i) != -1 :
			return true
	return false
	
# 删除自己
func delete():
	emit_signal("on_delete")
	owner.del_append(self)
	self.owner = null
	return self
	
# func connect(sig,target,method,binds=[],flags=0):
# 	if is_connected(sig,target,method) == false:
# 		.connect(sig,target,method,binds,flags)
	
# func delAllConnect():
# 	for i in get_incoming_connections ():
# 		i["source"].disconnect(i["signal_name"],self,i["method_name"])	
