mana = {
	quantity = 0,
	flag = false,
	mana_pressed = false,
	sprite = {
		id = 1,
		x = 60,
		y = 28,
		w = 8,
		h = 8
	},

	init = function(self)
		self.quantity = 0
		self.flag = false
		self.mana_pressed = false
	end,

	update = function(self)
		if storage.isFull then return end

		if action.state == "enable" then
			if mouse:is_pressed() and not self.flag then
				if mouse:is_clicked_on_area(self.sprite.x, self.sprite.y, self.sprite.w, self.sprite.h) then
					self.quantity += 1
					self.flag = true
					start_flag = true
					action.state = "disable"
				else
					self.flag = false
				end
			end
		end

		if mouse:is_released() then
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