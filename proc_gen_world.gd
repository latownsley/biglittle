extends Node2D

@export var noise_height_text : NoiseTexture2D
@onready var tile_map = $SproutLandsTileMap

var noise : Noise

# Settings and Vectors
var land_source_id = 1
var water_source_id = 7
var water_atlas = Vector2i(0,0)
var land_atlas = Vector2i(0,0)
var fence_source_id = 2
var fence_atlas_arr = [Vector2i(1,0), Vector2i(1,0), Vector2i(1,0)]

var dirt_tiles_arr = []
var terrain_dirt_int : int = 1

var grass_source_id = 0
var grass_tiles_arr = []
var terrain_grass_int : int = 0
var grass_atlas_arr = [Vector2i(0, 0), Vector2i(1, 0), Vector2i(2, 0), Vector2i(3, 0), Vector2i(4, 0), Vector2i(5, 0), Vector2i(0, 1), Vector2i(1, 1), Vector2i(2, 1), Vector2i(3, 1), Vector2i(4, 1), Vector2i(5, 1)]		# holds tiles of diff types of grass

# Enviornment Layers
var water_layer = 0
var dirt_layer = 1
var grass_layer = 2
var path_layer = 3
var fence_layer = 4
var crops_layer = 5
var walls_layer = 6
var roof_layer = 7
 
# Map size
var width : int = 400
var height : int = 400


func _ready():
	noise = noise_height_text.noise
	generate_world()

func generate_world():
	for x in range(-width/2, width/2):
		for y in range(-height/2, height/2):
			var noise_val = noise.get_noise_2d(x, y)
			# place land
			if noise_val >= 0.0:
				if noise_val > 0.2:
					grass_tiles_arr.append(Vector2i(x, y))
					
					if noise_val > 0.25:
						tile_map.set_cell(grass_layer, Vector2(x, y), grass_source_id, grass_atlas_arr.pick_random())
						
					if noise_val > 0.4:
						for i in range (0, 2):
							tile_map.set_cell(dirt_layer, Vector2(x + i, y + i), fence_source_id, fence_atlas_arr[i])
				dirt_tiles_arr.append(Vector2i(x, y))
				
			# place water everywhere on the bottom layer
			tile_map.set_cell(water_layer, Vector2(x, y), water_source_id, water_atlas)
	tile_map.set_cells_terrain_connect(dirt_layer,dirt_tiles_arr, terrain_dirt_int,0)
	tile_map.set_cells_terrain_connect(dirt_layer,grass_tiles_arr, terrain_grass_int,0)

