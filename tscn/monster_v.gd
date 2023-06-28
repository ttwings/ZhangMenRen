extends Area3D

#定义MonsterV类
class_name MonsterV

#定义on_hurt信号
signal on_hurt(body)

#定义monster变量
var monster:Chara

#当节点第一次进入场景树时调用
func _ready():
	#连接on_hurt信号和hurt函数
	connect("on_hurt",hurt)
	pass

#每帧调用，delta是自上一帧以来的时间
func _process(delta):
	pass

#播放动画
func anim_play(anim):
	$AnimationPlayer.play(anim)

#受伤函数
func hurt(body):
	#monster受伤
	monster.hurt(monster)
	#播放hurt动画
	anim_play("hurt")
