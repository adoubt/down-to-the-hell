extends Resource
class_name DataBase


@export var sound_configs = {
	"diegetic": {
		"one_shot": {
			"metal_scrach":[
				"res://assets/sounds/diegetic/one_shot/metal_scrach2.mp3",
				"res://assets/sounds/diegetic/one_shot/metal_scrach3.mp3",
				"res://assets/sounds/diegetic/one_shot/metal_scrach4.mp3",
				"res://assets/sounds/diegetic/one_shot/metal_scrach5.mp3",
				"res://assets/sounds/diegetic/one_shot/metal_scrach6.mp3",
				"res://assets/sounds/diegetic/one_shot/metal_scrach7.mp3",
				"res://assets/sounds/diegetic/one_shot/metal_scrach8.mp3",
				"res://assets/sounds/diegetic/one_shot/metal_scrach9.mp3",
				"res://assets/sounds/diegetic/one_shot/metal_scrach.mp3"
				
			],
			"enemy_died": [ "res://assets/sounds/diegetic/one_shot/enemy_death.mp3",
				"res://assets/sounds/diegetic/one_shot/enemy_death_2.mp3",
				"res://assets/sounds/diegetic/one_shot/enemy_death_3.mp3"
				],
			"enemy_hitted": [
				"res://assets/sounds/diegetic/one_shot/enemy_hitted.mp3",
				"res://assets/sounds/diegetic/one_shot/enemy_hitted_2.mp3",
				"res://assets/sounds/diegetic/one_shot/enemy_hitted_3.mp3",
				"res://assets/sounds/diegetic/one_shot/enemy_hitted_4.mp3",
			],
			"custom_sounds": []
		},
		"persistent": {
			"campfire_crackling" : "res://assets/sounds/diegetic/persistent/campfire-crackling-sound.mp3"
		},
	},
	"non_diegetic": {
		"music": {
			"combat_started":[
				"res://assets/sounds/non_diegetic/music/days_passed.mp3",
				"res://assets/sounds/non_diegetic/music/b gl.mp3",
				"res://assets/sounds/non_diegetic/music/amb kick.mp3",
				"res://assets/sounds/non_diegetic/music/deep sh.mp3",
				
			],
			"train":[
				"res://assets/sounds/non_diegetic/music/1252.mp3"
				
				],
			"idle":[
				"res://assets/sounds/non_diegetic/music/1244.mp3",
				"res://assets/sounds/non_diegetic/music/idle theme.mp3",
				"res://assets/sounds/non_diegetic/music/swamp.mp3",
				"res://assets/sounds/non_diegetic/music/ost tape.mp3",
				"res://assets/sounds/non_diegetic/music/1111111111111.mp3",
				],
			"hidden":
				[
				"res://assets/sounds/non_diegetic/music/noise2.mp3",
				"res://assets/sounds/non_diegetic/music/noise3.mp3",
				"res://assets/sounds/non_diegetic/music/noise4.mp3",
				"res://assets/sounds/non_diegetic/music/noise5.mp3",
				"res://assets/sounds/non_diegetic/music/noise6.mp3",
				"res://assets/sounds/non_diegetic/music/noise.mp3",		
				
				],
			"combat_completed":[
				"res://assets/sounds/non_diegetic/music/3 ost tera no drums.mp3",
				"res://assets/sounds/non_diegetic/music/1244.mp3",
				"res://assets/sounds/non_diegetic/music/1244.mp3",
				
				],
			"game_start" :
				["res://assets/sounds/non_diegetic/ui/Game Start.mp3",
				],
			
			
			"main_menu":
				["res://assets/sounds/non_diegetic/music/days_passed.mp3",
				"res://assets/sounds/non_diegetic/music/forget me slowly.mp3",
				"res://assets/sounds/non_diegetic/music/amb kick.mp3",
				"res://assets/sounds/non_diegetic/music/deep sh.mp3",
				"res://assets/sounds/non_diegetic/music/1244.mp3",
				"res://assets/sounds/non_diegetic/music/ost tape.mp3"],
			"death":
				[
				"res://assets/sounds/non_diegetic/music/death.mp3",
				],
			
				
		},
		"ui": {
			"game_start" :
				["res://assets/sounds/non_diegetic/ui/Game Start.mp3",
				],
			
			"menu_select": 
				["res://assets/sounds/non_diegetic/ui/tap4.mp3",
				],
			"note":
				["res://assets/sounds/non_diegetic/ui/note.mp3",
				],
			"note_reward":
				["res://assets/sounds/non_diegetic/ui/reward_counted.mp3",
				],
			"strange_tap":
				["res://assets/sounds/non_diegetic/ui/strange_tap.mp3",
				],
			"settings_select":
				["res://assets/sounds/non_diegetic/ui/tap6.mp3",
				],
			"map_opened":[
				"res://assets/sounds/non_diegetic/ui/tap7.mp3"
			],
			"map_closed":[
				"res://assets/sounds/non_diegetic/ui/tap2.mp3",
			],
			"menu_back": 
				["res://assets/sounds/non_diegetic/ui/tap2.mp3",],
			"item_selected":
				["res://assets/sounds/non_diegetic/ui/item_select.mp3",
				"res://assets/sounds/non_diegetic/ui/item_select2.mp3",
				"res://assets/sounds/non_diegetic/ui/item_select3.mp3",
				"res://assets/sounds/non_diegetic/ui/item_select4.mp3",
				"res://assets/sounds/non_diegetic/ui/item_select5.mp3",
				"res://assets/sounds/non_diegetic/ui/item_select6.mp3",
				"res://assets/sounds/non_diegetic/ui/item_select7.mp3",
				"res://assets/sounds/non_diegetic/ui/item_select8.mp3",
				"res://assets/sounds/non_diegetic/ui/item_select9.mp3",
				"res://assets/sounds/non_diegetic/ui/item_select10.mp3",
				],
			"map_node_selected":
				["res://assets/sounds/non_diegetic/ui/note.mp3"
				
				],
			"item_used":[
				"res://assets/sounds/non_diegetic/ui/map/map_node_select1.mp3",
				"res://assets/sounds/non_diegetic/ui/map/map_node_select2.mp3",
				"res://assets/sounds/non_diegetic/ui/map/map_node_select3.mp3",
				"res://assets/sounds/non_diegetic/ui/map/map_node_select4.mp3",
				"res://assets/sounds/non_diegetic/ui/map/map_node_select5.mp3",
				"res://assets/sounds/non_diegetic/ui/map/map_node_select6.mp3",
				],
			"money_arrived":
				["res://assets/sounds/non_diegetic/ui/money/money_arrived.mp3",
				"res://assets/sounds/non_diegetic/ui/money/money_arrived2.mp3",
				"res://assets/sounds/non_diegetic/ui/money/money_arrived3.mp3",
				"res://assets/sounds/non_diegetic/ui/money/money_arrived4.mp3"	
				],
			"purchased":
				["res://assets/sounds/non_diegetic/ui/money/purchase.mp3"
					
				],
			"purchase_failed":
				[
				"res://assets/sounds/non_diegetic/ui/money/purchase_failed.mp3"
					
				],
			"level_up" :
				["res://assets/sounds/non_diegetic/ui/level_up.wav",
				],
			"elite_entered":
				[
				"res://assets/sounds/non_diegetic/ui/day_entered/elite_entered2.mp3",
				"res://assets/sounds/non_diegetic/ui/day_entered/elite_entered3.mp3",
				"res://assets/sounds/non_diegetic/ui/day_entered/elite_entered4.mp3",
				"res://assets/sounds/non_diegetic/ui/day_entered/elite_entered.mp3",
												
				],
			"enemy_entered":
				[
				"res://assets/sounds/non_diegetic/ui/day_entered/enemy_entered2.mp3",
				"res://assets/sounds/non_diegetic/ui/day_entered/enemy_entered3.mp3",
				"res://assets/sounds/non_diegetic/ui/day_entered/enemy_entered4.mp3",
				"res://assets/sounds/non_diegetic/ui/day_entered/enemy_entered.mp3",
				
				],
			"boss_entered":[
				"res://assets/sounds/non_diegetic/ui/day_entered/boss_entered4.mp3",
				"res://assets/sounds/non_diegetic/ui/day_entered/boss_entered5.mp3",
				"res://assets/sounds/non_diegetic/ui/day_entered/boss_entered6.mp3",
				
				],
			"hidden_entered":
				[
				"res://assets/sounds/non_diegetic/ui/sand void fx.mp3"
				],
			"chest_entered":
				[
				"res://assets/sounds/non_diegetic/ui/sand void fx.mp3"	
				],
			"lobby_entered":
				["res://assets/sounds/non_diegetic/ui/sand void fx.mp3"],
			"combat_completed_signal":
				["res://assets/sounds/non_diegetic/ui/combat_completed.mp3",
				],
			"combat_started_signal":
				[
				],
		},	
	}
}

@export var shaders_config = {
	"vhs" : "res://assets/Shaders/PostProcess/vhscamera3.gdshader",
	"vhs2": "res://assets/Shaders/PostProcess/vhs_shader.gdshader",
	"vhs3" : "res://assets/Shaders/PostProcess/VHS3.gdshader",
	"kuwahara" : "res://assets/Shaders/PostProcess/kuwahara.gdshader",
	"vignette" :"res://assets/Shaders/PostProcess/Vignette.gdshader",
	"Film": "res://assets/Shaders/PostProcess/Film.gdshader"
	
	
}

@export var vfx_configs = {
	"physics": {
		"scene" : "res://Scenes/hit_particle.tscn",
		"duration" : 0.5
	}
}
