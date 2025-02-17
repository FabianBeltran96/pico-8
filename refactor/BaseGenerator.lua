-- Clase base para generadores
BaseGenerator = {}
BaseGenerator.__index = BaseGenerator

function BaseGenerator:new(params)
  local obj = setmetatable({}, self)
  -- Parámetros básicos (con valores por defecto)
  obj.x = params.x or 0
  obj.y = params.y or 64
  obj.w = params.w or 42
  obj.h = params.h or 42
  obj.cost = params.cost or 10
  obj.production = params.production or 1
  obj.interval = params.interval or 30
  -- frames entre producción
  obj.quantity = 0
  -- cuántas unidades compradas
  obj.time = 0
  -- contador interno
  obj.flag = false
  -- bandera para el click
  obj.sprite_id = params.sprite_id or 0
  -- id del sprite
  return obj
end

function BaseGenerator:update()
  -- Detectar click para comprar el generador
  if mouse:is_pressed() and not self.flag then
    if mouse:is_clicked_on_area(self.x, self.y, self.w, self.h) then
      if mana.quantity >= self.cost then
        mana.quantity = mana.quantity - self.cost
        self.quantity = self.quantity + 1
        self.flag = true
        self.cost = self.cost + 1 -- aumenta el costo, por ejemplo
      end
    end
  end

  if mouse:is_released() then
    self.flag = false
  end

  -- Limitar el maná según el almacenamiento
  -- if mana.quantity >= storage.total then
  --   mana.quantity = storage.total
  --   return
  -- end

  -- Producción de maná cada vez que el tiempo se reinicia
  if self.quantity > 0 and self.time == 0 then
    mana.quantity = mana.quantity + (self.production * self.quantity)
  end

  -- Control del tiempo
  if self.time >= self.interval then
    self.time = 0
  else
    self.time = self.time + 1
  end
end

function BaseGenerator:draw()
  -- Ejemplo de dibujo (puedes personalizar el sprite y posición)
  print("Type: " .. self.production .. "x", self.x, self.y, 7)
  print("Unit:" .. self.quantity, self.x + self.h, self.y, 7)
  print("Cost:" .. self.cost, self.x + self.h * 2, self.y, 7)
end