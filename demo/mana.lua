--mana
function mana_init()
	mana = {
		quantity = 0,
		flag = false,
		mana_pressed = false
	}
end

function mana_update()
	if storage.isFull then
		return
	end

	if action_state == "enable" then
		if stat(34) == 1 and not mana.flag then
			if ((stat(32) >= 61) and (stat(32) <= 67)) then
				if ((stat(33) >= 29) and (stat(33) <= 36)) then
					mana.quantity += 1
					mana.flag = true
					start_flag = true
					action_state = "disable"
				else
					mana.flag = false
				end
			end
		end
	end

	if stat(34) == 0 then
		mana.flag = false
	end
end

function mana_draw()
	if mana.flag then
		spr(1, 61, 29)
	else
		spr(1, 60, 28)
	end

	print("mana: " .. mana.quantity, 2, 2)
	print(building.quantity .. "/s")
end