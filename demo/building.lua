function building_init()
	building = {
		quantity = 0,
		flag = false,
		time = 0,
		cost = 10
	}
end

function building_update()
	if stat(34) == 1 and not building.flag then
		if ((stat(32) >= 0) and (stat(32) <= 64)) then
			if ((stat(33) >= 64) and (stat(33) <= 128)) then
				if (mana.quantity >= building.cost) then
					mana.quantity -= building.cost
					building.quantity += 1
					building.flag = true
					building.cost += 1
				end
			end
		end
	end

	if stat(34) == 0 then
		building.flag = false
	end

	if (mana.quantity >= store_t) then
		mana.quantity = store_t
		return
	end

	if (building.quantity > 0 and building.time == 0) then
		mana.quantity += 1 * building.quantity
	end

	if (building.time == 30) then
		building.time = 0
	else
		building.time += 1
	end
end

function building_draw()
	print("bdg unit:" .. building.quantity, 2, 66, 7)
	print("bdg cost:" .. building.cost)
end