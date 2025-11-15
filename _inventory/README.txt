Ajoutez ceci dans : ox_inventory/data/items.lua 

	['cm_coffee'] = {
		label = 'Café',
		weight = 240,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `p_ing_coffeecup_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'Vous avez bu un café.'
		}
	},

	['coffee_bean'] = {
		label = 'Graines de café',
		weight = 50,
	},