extends Node

## calculates an array of cells within the FOV of the origin within radius range
# data is a 2d array of cells
# origin is a cell to  cast FOV from
# radius = distance in cells to (only cells within radius range are considered)

func calucate_fov(data,wall_index,origin,radius):
	pass

func get_fov_rect(origin,radius):
	pass

func is_wall(data,wall_index,cell):
#	return data[cell.x][cell.y] = wall_index
	pass

func cast_fov_ray(data,wall_index,from,to):
	pass

func get_line(from,to):
	pass

