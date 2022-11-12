extends Node

var image:Image = load(ProjectSettings.get_setting("shader_globals/heightmap").value).get_image()
var amplitude:float = ProjectSettings.get_setting("shader_globals/amplitude").value

var size = image.get_width()

func get_height(x,z):
	return image.get_pixel(fposmod(x,size), fposmod(z,size)).r * amplitude
