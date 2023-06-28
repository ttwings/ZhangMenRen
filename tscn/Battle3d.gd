extends Node3D

@onready var player = $"Player"
@onready var monster = $"MonsterV"
@onready var anim_player = $Player/AnimationPlayer
@onready var anim_monster = $Monster/AnimationPlayer

@onready var bullets = $Bullets

signal on_player_attack_end
signal on_monster_attack_end
# Called when the node enters the scene tree for the first time.
func _ready():
#	connect("on_player_attack",player_attack())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func player_attack():
#	anim_player.play("attack")
#	var eff = preload("res://effects/e_沙暴拳.tscn").instantiate()
#	eff.position = monster.position
#	add_eff(eff)
	add_bullet()
#	anim_player.connect("animation_finished",_player_attack_end())
func monster_attack():
	_monster_attack()


func _monster_attack():
	monster.get_node("AnimationPlayer").play("attack")
	
	player.get_node("AnimationPlayer").play("hurt")

func _player_hurt():
	player.get_node("AnimationPlayer").play("hurt")


func _player_attack_end():
	print_debug("player attack end")
	emit_signal("on_player_attack_end")
	
func _effect():
	pass
	
func add_eff(eff):
	$Effect.add_child(eff)		

var b:Bullet
func add_bullet():
	b = preload("res://bullets/bullet_拳.tscn").instantiate()
	bullets.add_child(b)
	b.target = monster
	b.transform = player.global_transform
	b.velocity = b.transform.basis.z * b.muzzle_velocity
#	b.connect("body_entered",monster)

func hit():
	pass
#	print_debug("hit")
