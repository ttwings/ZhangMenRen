extends Area3D
class_name Bullet
signal on_hit

@export var muzzle_velocity = 10

var attack:Attack = null
var target = null
var velocity = Vector3.ZERO


# 不需要重力，飞向目标target
func _physics_process(delta):
#	if target != null:
#		look_at(target.transform.origin, Vector3.UP)
	if target != null:
		var t_pos = target.global_transform.origin
		var pos = global_transform.origin
		var dir = (t_pos - pos).normalized()
		look_at(t_pos, Vector3.UP)
		velocity = dir * muzzle_velocity
		pass
	transform.origin += velocity * delta


## 当子弹碰到墙壁时，销毁子弹，当子弹碰到敌人时，销毁子弹并造成伤害，当子弹碰到物体时，销毁子弹
func _on_area_entered(area):
	emit_signal("on_hit",transform.origin)
	print_debug(area)
	if area is_in_group("wall"):
		queue_free()
	if area is_in_group("obj"):
		emit_signal("on_hit",transform.origin)
		area.emit_signal("on_hurt",self)
		queue_free()
	if area is_in_group("enemy") :
		emit_signal("on_hit",transform.origin)
		area.emit_signal("on_hurt",self)
		queue_free()

