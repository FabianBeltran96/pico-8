mana = {
    quantity = 0,
    flag = false,
    mana_pressed = false,
    sprite = {
        id = 1,
        x = 60,
        y = 28,
        w = 8,
        h = 8
    },

    init = function(self)
        self.quantity = 0
        self.flag = false
        self.mana_pressed = false
    end,

    update = function(self)
        -- Si la cantidad de maná es mayor o igual al total, entonces el almacenamiento está lleno.

        if action.state == "enable" then
            -- Valida si el botón del mouse está presionado y la bandera es falsa.
            if mouse:is_pressed() and not self.flag then
                -- Valida si el mouse está clickeado en el área del sprite.
                if mouse:is_clicked_on_area(self.sprite.x, self.sprite.y, self.sprite.w, self.sprite.h) then
                    self.quantity += 1
                    self.flag = true
                    start_flag = true
                    action.state = "disable"
                else
                    self.flag = false
                end
            end
        end

        -- Valida si el botón del mouse ha sido liberado.
        if mouse:is_released() then
            self.flag = false
        end
    end,

    draw = function(self)
        -- Dibuja el sprite del maná.
        if self.flag then
            spr(1, 61, 29)
        else
            spr(1, 60, 28)
        end

        -- Dibuja la cantidad de maná, en la esquina superior izquierda de la pantalla.
        print("mana: " .. self.quantity, 2, 2)
    end
}