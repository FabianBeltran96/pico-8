function _init()
	-- Inicialización de los módulos.
	mouse:init()
	action:init()
	mana:init()
	-- Crear el gestor de generadores
	genManager = GeneratorManager:new()

	-- Crear 3 tipos de generadores con diferentes parámetros:
	local gen1 = BaseGenerator:new({ x = 1, y = 65, cost = 10, production = 1, interval = 30, sprite_id = 3 })
	local gen2 = BaseGenerator:new({ x = 1, y = 65 + 21, cost = 50, production = 5, interval = 60, sprite_id = 2 })
	local gen3 = BaseGenerator:new({ x = 1, y = 65 + 42, cost = 100, production = 10, interval = 90, sprite_id = 1 })

	genManager:addGenerator(gen1)
	genManager:addGenerator(gen2)
	genManager:addGenerator(gen3)
end

function _update()
	-- Actualización de los módulos.
	mouse:update()
	action:update()
	mana:update()
	genManager:update()
	-- Actualizamos todos los generadores
end

function _draw()
	-- Limpiar la pantalla y dibujar el mapa.
	cls()
	map()

	-- Dibujar los módulos.
	mana:draw()
	action:draw()
	genManager:draw()
	-- Dibuja todos los generadores
	-- Al final para que el mouse se renderice sobre todo lo demás.
	mouse:draw()
end