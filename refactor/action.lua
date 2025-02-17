action = {
	state = "enable", -- enable or disable
	time = 30,
	clock = 0,

	-- Inicialización de la acción.
	init = function(self)
		self.state = "enable"
		self.time = 30
		self.clock = 0
	end,

	update = function(self)
		-- Validar si la acción está habilitada.
		if (action.state == "disable") then
			action.clock += 1
		end

		-- Validar si el tiempo de la acción ha terminado.
		if (action.clock == 30) then
			action.clock = 0
			action.state = "enable"
		end
	end,

	draw = function()
		-- Muestra el estado de la acción.
		if action.state == "enable" then
			rect(0, 0, 127, 127, 11)
		else
			rect(0, 0, 127, 127, 5)
		end
	end
}