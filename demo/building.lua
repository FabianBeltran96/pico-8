building = {
	quantity = 0,
	flag = false,
	time = 0,
	cost = 10,
	sprite = {
		x = 0,
		y = 64,
		w = 64,
		h = 64
	},


	init = function(self)
		self.quantity = 0
		self.flag = false
		self.time = 0
		self.cost = 10
	end,

	update = function(self)
		if mouse.is_pressed and not self.flag then
			if mouse:is_clicked_on_area(self.sprite.x, self.sprite.y, self.sprite.w, self.sprite.h) then
				if (mana.quantity >= self.cost) then
					mana.quantity -= self.cost
					self.quantity += 1
					self.flag = true
					self.cost += 1
				end
			end
		end

		if stat(34) == 0 then
			self.flag = false
		end

		if (mana.quantity >= storage.total) then
			mana.quantity = storage.total
			return
		end

		if (self.quantity > 0 and self.time == 0) then
			mana.quantity += 1 * self.quantity
		end

		if (self.time == 30) then
			self.time = 0
		else
			self.time += 1
		end
	end,

	draw = function(self)
		print("bdg unit:" .. self.quantity, 2, 66, 7)
		print("bdg cost:" .. self.cost)
	end
}