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

	-- Inicialización del edificio.
	init = function(self)
		self.quantity = 0
		self.flag = false
		self.time = 0
		self.cost = 10
	end,

	update = function(self)
		-- Validar si el mouse está presionado, y no se ha presionado antes (flag).
		if mouse:is_pressed() and not self.flag then
			if mouse:is_clicked_on_area(self.sprite.x, self.sprite.y, self.sprite.w, self.sprite.h) then
				if (mana.quantity >= self.cost) then
					mana.quantity -= self.cost
					self.quantity += 1
					self.flag = true
					self.cost += 1
				end
			end
		end

		-- Validar si el mouse está liberado.
		if mouse:is_released() then
			-- Reiniciar la bandera.
			self.flag = false
		end

		-- Validar si la cantidad de maná es mayor o igual al almacenamiento total.
		if (mana.quantity >= storage.total) then
			-- El almacenamiento está lleno.
			mana.quantity = storage.total
			return
		end	

		-- Validar si la cantidad de maná es mayor a 0 y el tiempo es 0.
		if (self.quantity > 0 and self.time == 0) then
			-- Aumentar la cantidad de maná.
			mana.quantity += 1 * self.quantity
		end

		-- Validar si el tiempo es 30 = 1 seg.
		if (self.time == 30) then
			-- Reiniciar el tiempo.
			self.time = 0
		else
			-- Aumentar el tiempo.
			self.time += 1
		end
	end,

	draw = function(self)
		print("bdg unit:" .. self.quantity, 2, 66, 7)
		print("bdg cost:" .. self.cost)
	end
}