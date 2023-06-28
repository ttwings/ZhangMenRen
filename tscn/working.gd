extends Control

## 工作显示ui
## 当progress条满了之后，发送工作完成信号
## 工作完成后，发送工作效果信号
signal progress_completed

@onready var progress = $Label/ProgressBar
@onready var work_name = $Label
@onready var color = $Label/ColorRect

@export var work:Work
@export var work_practice : int

@export var is_working : bool = false

func _ready():
	work_name.text = work.alias
	progress.max_value = work.workload
	progress.value = 0
	progress_completed.connect(_completed)

func _process(delta):
	if is_working:
		progress.value += work_practice * delta
		if progress.value >= progress.max_value :
			progress.value = 0
			emit_signal("progress_completed")
			
	
func _completed():
	print_debug(work.output)
	return work.output	
