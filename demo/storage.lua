storage = {
	quantity = 1,
	flag = false,
	isFull = false,
	flag = false,
	cost = 10,
	sprite = {
		x = 64,
		y = 64,
		w = 64,
		h = 64
	},
	types = {
		"Mana Bottle",
		"Mana Vault",
		"Etherial Fountain"
	},

	init = function(self)
		self.quantity = 1
		self.flag = false
		self.isFull = false
		self.flag = false
		self.total = self.quantity * 10
		self.cost = 10
	end,

	update = function(self)
		self.total = self.quantity * 10

		if (mana.quantity >= self.total) then
			self.isFull = true
		else
			self.isFull = false
		end

		if mouse:is_pressed() and not self.flag then
			if mouse:is_clicked_on_area(self.sprite.x, self.sprite.y, self.sprite.w, self.sprite.h) then
				if (mana.quantity >= self.cost) then
					mana.quantity -= 10
					self.quantity += 1
					self.flag = true
					self.cost += 1
				end
			end
		end

		if stat(34) == 0 then
			self.flag = false
		end
	end,

	draw = function(self)
		local start = 64
		for i = 0, 2 do
			-- printh(self.types[i],"log")
			spr(i + 2, start + 4, 64 + (i * 21) + 4)
			-- rectfill(64 + (i * 21), 64 + 42, 64 + (i * 21) + 1, 64 + 42 + 1, 7)
			-- rectfill(64, 64 + 42, 128, 64 + 42 + 1, 7)
		end
		-- spr(2, 64, 64, 64, 64)
		-- spr(3, 64, 64, 64, 64)
	end
}