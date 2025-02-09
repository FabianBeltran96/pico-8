building = {
	quantity = 0,
	flag = false,
	time = 0,
	cost = 10,

	init = function(self)
		self.quantity = 0
		self.flag = false
		self.time = 0
		self.cost = 10
	end,

	update = function(self)
		if stat(34) == 1 and not self.flag then
			if ((stat(32) >= 0) and (stat(32) <= 64)) then
				if ((stat(33) >= 64) and (stat(33) <= 128)) then
					if (mana.quantity >= self.cost) then
						mana.quantity -= self.cost
						self.quantity += 1
						self.flag = true
						self.cost += 1
					end
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