function _init()
	-- Inicialización de las variables.
	clock = 0
	secs = 0
	start_flag = false

	-- Inicialización de los módulos.
	mouse:init()
	action:init()
	mana:init()
	building:init()
	storage:init()
end

function _update()
	-- Actualización de los módulos.
	mouse:update()
	mana:update()
	building:update()
	storage:update()
	action:update()

	-- Lógica del juego.
	if start_flag then
		if (clock >= 30) then
			secs += 1
			clock = 0
		end
	end

	clock += 1

	-- Lógica de la victoria.
	if (mana.quantity >= 100) then
		start_flag = false
	end
end

function _draw()
	-- Limpiar la pantalla y dibujar el mapa.
	cls()
	map()

	-- Dibujar el tiempo transcurrido.
	print("segundos: " .. secs, 64, 2)

	-- Dibujar los módulos.
	mana:draw()
	building:draw()
	storage:draw()
	action:draw()

	-- Dibujar el mouse.
	-- Al final para que el mouse se renderice sobre todo lo demás.
	mouse:draw()
end