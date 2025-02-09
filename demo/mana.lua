mana = {
	quantity = 0,
	flag = false,
	mana_pressed = false,

	init = function(self)
		self.quantity = 0
		self.flag = false
		self.mana_pressed = false
	end,

	update = function(self)
		if storage.isFull then return end

		if action.state == "enable" then
			if stat(34) == 1 and not self.flag then
				if ((stat(32) >= 61) and (stat(32) <= 67)) then
					if ((stat(33) >= 29) and (stat(33) <= 36)) then
						self.quantity += 1
						self.flag = true
						start_flag = true
						action.state = "disable"
					else
						self.flag = false
					end
				end
			end
		end

		if stat(34) == 0 then
			self.flag = false
		end
	end,

	draw = function(self)
		if self.flag then
			spr(1, 61, 29)
		else
			spr(1, 60, 28)
		end

		print("mana: " .. self.quantity, 2, 2)
		print(building.quantity .. "/s")
	end
}