storage = {
	units = 1,
	flag = false,
	isFull = false,
	flag = false,
	cost = 10,

	init = function(self)
		self.units = 1
		self.flag = false
		self.isFull = false
		self.flag = false
		self.total = self.units * 10
		self.cost = 10
	end,

	update = function(self)
		self.total = self.units * 10

		if (mana.quantity >= self.total) then
			self.isFull = true
		else
			self.isFull = false
		end

		if stat(34) == 1 and not self.flag then
			if ((stat(32) >= 64) and (stat(32) <= 128)) then
				if ((stat(33) >= 64) and (stat(33) <= 128)) then
					if (mana.quantity >= self.cost) then
						mana.quantity -= 10
						self.units += 1
						self.flag = true
						self.cost += 1
					end
				end
			end
		end

		if stat(34) == 0 then
			self.flag = false
		end
	end,

	draw = function(self)
		print("store: " .. mana.quantity .. "/" .. self.total, 66, 66)
		print("store q: " .. self.units)
		print("store cost :" .. self.cost)
	end
}