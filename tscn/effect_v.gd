extends Node3D

class_name EffectV

signal on_reach()
signal on_in_cell(cell)

var pos_move = Vector2()
var spr = null
@onready var normal_spr = $Spr/Normal
var anim = null
var fly_mode = 0  #0:不飞行     1:目标单位   2：目标位置
var fly_cha = null
var fly_speed = 200
var fly_pos =Vector2()
var cell = Vector2()

func _ready():
#	set_physics_process(false)
	spr = $Spr
	anim = $AnimationPlayer
#	anim.connect("animation_finished",animation_finished)
	
func _physics_process(delta):
	var t_pos = Vector2()
	if fly_mode == 2 :
		t_pos = fly_pos
		normal_spr.look_at(Sys.main.scene.position + t_pos + normal_spr.position)
		if Sys.main.map.world_to_map(position) != cell:
			cell = Sys.main.map.world_to_map(position)
			emit_signal("on_in_cell",cell)
	elif fly_mode == 1:
		if Sys.isClass(fly_cha,"Chara") : 
			t_pos = fly_cha.position
			if fly_cha.is_inside_tree() :
				normal_spr.look_at(fly_cha.global_position + normal_spr.position)
		else:
			queue_free()
	if fly_mode != 0 :
		var lpos = t_pos - position
		pos_move = lpos.normalized() * fly_speed
		position += pos_move * delta
		#normal_spr.rotation = position.angle_to_point(pos_move)
		if lpos.length() <= fly_speed * delta:
			emit_signal("onReach")
			queue_free()
			
func _initFlyCha(cha,fly_speed = 300):
	fly_cha = cha
	fly_mode = 1
	self.fly_speed = fly_speed
	scale.x = 1
	set_physics_process(true)

func _initFlyPos(pos,fly_speed = 300):
	fly_pos = pos
	self.cell = Sys.main.map.world_to_map(pos)
	fly_mode = 2
	self.fly_speed = fly_speed
	scale.x = 1
	set_physics_process(true)
	
func setNorPos(pos):
	if normal_spr!= null: normal_spr.position = pos
	
func play(name):
	anim.play(name)
	
func move(x=0,y=0):
	pos_move.x = x
	pos_move.y = y
	set_physics_process(true)

func speed(s):
	pos_move = pos_move.normalized() * s
	
func pause(bl = true):
	if bl :
		anim.playback_speed = 0
		set_physics_process(false)
	else:
		anim.playback_speed = 1
		set_physics_process(true)

func animation_finished(anim_name):
	_del()
	anim_name = ""
	queue_free()
	
func _del():
	pass

func sprLookAt(pos):
	normal_spr.look_at(pos + normal_spr.position)
