mouse = {
    x = 0,
    y = 0,
    button = 0,

    -- Inicialización del mouse.
    init = function(self)
        poke(0x5f2d, 1)
    end,

    -- Actualización del mouse.
    update = function(self)
        self.x = stat(32)
        self.y = stat(33)
        self.button = stat(34)
    end,

    -- Dibujar el mouse.
    draw = function(self)
        circfill(self.x, self.y, 1, 6)
        -- Muestra la posición del mouse en la pantalla.
        -- print(self.x .. ", " .. self.y, self.x + 4, self.y - 4, 6)
    end,

    -- Métodos de la clase.
        -- is_pressed: Devuelve verdadero si el botón del mouse está presionado.
    is_pressed = function(self)
        return self.button == 1
    end,

        -- is_released: Devuelve verdadero si el botón del mouse está liberado.
    is_released = function(self)
        return self.button == 0
    end,

        -- is_clicked_on_area: Devuelve verdadero si el mouse está clickeado en un área.
    is_clicked_on_area = function(self, x, y, w, h)
        return self.x >= x and self.x <= x + w and self.y >= y and self.y <= y + h
    end
}