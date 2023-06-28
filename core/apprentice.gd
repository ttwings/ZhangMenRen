extends Node
class_name Apprentice

@export var family = {
	master_id = "",		# 师傅id
	master_name = "",	# 师傅名字
	family_name = "",	# 门派名字
	enter_time = 0,		# 进入时间
	title = "",			# 门派称号
	privs = 0,			# 权限
	generation = 0,		# 门派代数
}

## ready
func _ready():
	if owner is Base and not owner.query("family"):
		owner.set("family", family)

## 是否是ob的徒弟
func is_apprentice_of(ob:Base):
	if not ob.query("family"):
		return 0
	if family["master_id"] == ob.query("id") and family["master_name"] == ob.query("name"):
		return 1
	return 0

## 分派门派内称号
func assign_apprentice(title:String, privs:int):
	if not owner.query("family"):
		return 0

	family["title"] = title;
	family["privs"] = privs;

	# if( userp(this_object()) || !query("title") ) {
	# 	if( family["generation"]==1 )
	# 		set("title", family["family_name"] + "¿ªÉ½×æÊ¦");
	# 	else
	# 		set("title", sprintf("%sµÚ%s´ú%s", family["family_name"],
	# 			chinese_number(family["generation"]), family["title"]));

## 创建门派
func create_family(family_name:String, generation:int, title:String):

	family["family_name"] = family_name;
	family["generation"] = generation;

	owner.set("family", family);

	assign_apprentice( title, -1 );

## 招收徒弟
func recruit_apprentice(ob:Base):
	var my_family
	var family
	if ob.is_apprentice_of(self):
		return 0
	if not owner.query("family"):
		return 0
	
	my_family = owner.query("family")
	
	family["master_id"] = owner.query("id")
	family["master_name"] = owner.query("name")
	family["family_name"] = my_family["family_name"]
	family["generation"] = my_family["generation"] + 1
#	family["enter_time"] = time()
	ob.set("family", family)
	ob.assign_apprentice("入门弟子", 0)
	return 1

