-- Clase Generador
Generador = {}
Generador.__index = Generador

-- Constructor de la clase
function Generador:new(o)
    o = o or {}
    setmetatable(o, self)
    o.x = o.x or 0
    -- posición x
    o.y = o.y or 0
    -- posición y
    o.cost = o.cost or 10
    -- costo para comprarlo
    o.production = o.production or 1
    -- cantidad de mana que produce por ciclo
    o.interval = o.interval or 60
    -- cantidad de frames entre producciones
    o.timer = 0
    -- contador interno
    o.owned = false
    -- si ya fue comprado
    return o
end

-- Método para comprar el generador
function Generador:buy()
    if mana.quantity >= self.cost and not self.owned then
        mana.quantity = mana.quantity - self.cost
        self.owned = true
    end
end

-- Método de actualización (llámalo en cada frame)
function Generador:update()
    if self.owned then
        self.timer = self.timer + 1
        if self.timer >= self.interval then
            mana.quantity = mana.quantity + self.production
            self.timer = 0
        end
    else
        -- Opcional: detectar click para comprar el generador.
        if mouse:is_pressed() and mouse:is_clicked_on_area(self.x, self.y, 8, 8) then
            self:buy()
        end
    end
end

-- Método de dibujo
function Generador:draw()
    if self.owned then
        spr(2, self.x, self.y) -- sprite activo
    else
        spr(3, self.x, self.y) -- sprite para mostrar que se puede comprar
    end
    -- Opcional: dibujar el costo sobre el generador
    print("Costo:" .. self.cost, self.x, self.y - 8)
end

