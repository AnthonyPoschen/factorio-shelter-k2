local path = "__shelter-k2__/"
local images_path = path .. "images/"
local remanents_path = images_path .. "remnants/"
local buildings_path = path .. "buildings/"
local prototypes_path = path .. "prototypes/"
local entities_path = images_path .. "entities/"
local sound_path = path .. "sounds/"

local kr_icons_size = false

local empty_sprite = {
	filename = entities_path .. "empty.png",
	priority = "high",
	width = 1,
	height = 1,
	scale = 0.5,
	shift = { 0, 0 },
}

local shelter_animation = {
	layers = {
		{
			filename = entities_path .. "shelter/shelter-light.png",
			priority = "high",
			width = 256,
			height = 256,
			scale = 0.9,
			shift = { -0.05, 0 },
			draw_as_light = true,
			frame_count = 6,
			line_length = 3,
			animation_speed = 0.5,
			hr_version = {
				filename = entities_path .. "shelter/hr-shelter-light.png",
				priority = "high",
				width = 512,
				height = 512,
				scale = 0.45,
				shift = { -0.05, 0 },
				draw_as_light = true,
				frame_count = 6,
				line_length = 3,
				animation_speed = 0.5,
			},
		},
		{
			filename = entities_path .. "shelter/shelter.png",
			priority = "high",
			width = 256,
			height = 256,
			scale = 0.9,
			shift = { -0.05, 0 },
			frame_count = 6,
			line_length = 3,
			animation_speed = 0.5,
			hr_version = {
				filename = entities_path .. "shelter/hr-shelter.png",
				priority = "high",
				width = 512,
				height = 512,
				scale = 0.45,
				shift = { -0.05, 0 },
				frame_count = 6,
				line_length = 3,
				animation_speed = 0.5,
			},
		},
		{
			filename = entities_path .. "shelter/shelter-shadow.png",
			priority = "high",
			width = 256,
			height = 256,
			scale = 0.9,
			shift = { 0.42, 0 },
			frame_count = 6,
			line_length = 3,
			animation_speed = 0.5,
			draw_as_shadow = true,
			hr_version = {
				filename = entities_path .. "shelter/hr-shelter-shadow.png",
				priority = "high",
				width = 512,
				height = 512,
				scale = 0.45,
				shift = { 0.42, 0 },
				frame_count = 6,
				line_length = 3,
				animation_speed = 0.5,
				draw_as_shadow = true,
			},
		},
	},
}

-- Shelter
data:extend({
	{
		type = "electric-energy-interface",
		name = "kr-shelter",
		icon = images_path .. "shelter.png",
		icon_size = 64,
		allow_copy_paste = false,
		flags = {
			"placeable-player",
			"player-creation",
			"not-deconstructable",
			"not-rotatable",
			"not-blueprintable",
			"not-repairable",
			"not-on-map",
		},
		fast_replaceable_group = "kr-shelter",
		minable = { mining_time = 0.5, result = "kr-shelter" },
		collision_box = { { -2.72, -2.72 }, { 2.72, 2.72 } },
		selection_box = { { 0, 0 }, { 0, 0 } },
		animation = shelter_animation,
		continuous_animation = true,
		energy_source = {
			type = "electric",
			buffer_capacity = "120kJ",
			usage_priority = "primary-output",
			input_flow_limit = "0kW",
			output_flow_limit = "120kW",
			render_no_power_icon = false,
			render_no_network_icon = false,
		},
		energy_production = "120kW",
	},
	-- Shelter
	{
		type = "container",
		name = "kr-shelter-container",
		localised_name = { "item-name.kr-shelter" },
		localised_description = { "item-description.kr-shelter" },
		icon = images_path .. "shelter.png",
		icon_size = 64,
		allow_copy_paste = false,
		flags = { "player-creation", "not-rotatable", "not-blueprintable" },
		minable = { mining_time = 0.5, result = "kr-shelter" },
		max_health = 1500,
		corpse = "kr-medium-random-pipes-remnant",
		collision_box = { { -2.75, -2.75 }, { 2.75, 2.75 } },
		selection_box = { { -3, -3 }, { 3, 3.20 } },
		resistances = {
			{ type = "physical", percent = 50 },
			{ type = "fire", percent = 75 },
			{ type = "impact", percent = 75 },
		},
		water_reflection = {
			pictures = {
				filename = entities_path .. "shelter/shelter-reflection.png",
				priority = "extra-high",
				width = 60,
				height = 50,
				shift = util.by_pixel(0, 40),
				variation_count = 1,
				scale = 5,
			},
			rotate = false,
			orientation_to_variation = false,
		},

		picture = shelter_animation,
		inventory_size = 200,
		scale_info_icons = kr_icons_size,
		open_sound = { filename = sound_path .. "open.ogg", volume = 1 },
		close_sound = { filename = sound_path .. "close.ogg", volume = 1 },
		vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
	},
	-- shelter corpse
	{
		type = "corpse",
		name = "kr-medium-random-pipes-remnant",
		icon = remanents_path .. "remnants-icon.png",
		icon_size = 64,
		flags = { "placeable-neutral", "building-direction-8-way", "not-on-map" },
		selection_box = { { -3, -3 }, { 3, 3 } },
		tile_width = 9,
		tile_height = 9,
		selectable_in_game = false,
		subgroup = "remnants",
		order = "z[remnants]-a[generic]-b[medium]",
		time_before_removed = 60 * 60 * 20, -- 20 minutes
		final_render_layer = "remnants",
		remove_on_tile_placement = false,
		animation = make_rotated_animation_variations_from_sheet(1, {
			filename = remanents_path .. "medium-random-pipes-remnant.png",
			line_length = 1,
			width = 175,
			height = 175,
			frame_count = 1,
			direction_count = 1,
			hr_version = {
				filename = remanents_path .. "hr-medium-random-pipes-remnant.png",
				line_length = 1,
				width = 350,
				height = 350,
				frame_count = 1,
				direction_count = 1,
				scale = 0.5,
			},
		}),
	},
})
