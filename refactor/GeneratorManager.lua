-- Gestor de Generadores
GeneratorManager = {}
GeneratorManager.__index = GeneratorManager

function GeneratorManager:new()
    local obj = setmetatable({}, self)
    obj.generators = {}
    -- Inicializa correctamente la lista de generadores
    return obj
end

function GeneratorManager:addGenerator(gen)
    if self.generators == nil then
        self.generators = {}
    end
    self.generators[#self.generators + 1] = gen
end
function GeneratorManager:update()
    for i, gen in ipairs(self.generators) do
        gen:update()
    end
end

function GeneratorManager:draw()
    for i, gen in ipairs(self.generators) do
        gen:draw()
    end
end