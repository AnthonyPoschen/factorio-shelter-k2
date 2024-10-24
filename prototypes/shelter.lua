local path = "__shelter-k2__/"
local images_path = path .. "images/"
local buildings_path = path .. "buildings/"
local prototypes_path = path .. "prototypes/"
local entities_path = images_path .. "entities/"
local sound_path = path .. "sounds/"

data:extend({
	-- image
	{
		type = "sprite",
		name = "kr-shelter-preview",
		filename = images_path .. "shelter-preview.png",
		width = 408,
		height = 265,
	},
	-- item
	{
		type = "item",
		name = "kr-shelter",
		icon = images_path .. "shelter.png",
		icon_size = 64,
		subgroup = "storage",
		order = "aaa",
		place_result = "kr-shelter",
		stack_size = 1,
	},
	-- recipe
	{
		type = "recipe",
		name = "kr-shelter",
		energy_required = 10,
		enabled = false,
		ingredients = {
			{ type = "item", name = "iron-plate", amount = 25 },
			{ type = "item", name = "copper-cable", amount = 10 },
			{ type = "item", name = "coal", amount = 50 },
		},
		results = {
			{ type = "item", name = "kr-shelter", amount = 1 },
		},
	},
	-- research
	{
		type = "technology",
		name = "kr-shelter",
		mod = "shelter-k2",
		icon = images_path .. "shelter.png",
		icon_size = 64,
		effects = {
			{
				type = "unlock-recipe",
				recipe = "kr-shelter",
			},
		},
		--		prerequisites = {""},
		unit = {
			count = 20,
			ingredients = {
				{ "automation-science-pack", 1 },
			},
			time = 30,
		},
	},
})

