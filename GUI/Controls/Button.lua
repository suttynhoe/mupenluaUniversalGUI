Button = middleclass('Button', Control)

function Button:initialize(containingScene, clickKey, x, y, w, h, text, primaryMouseClickCallback,
    secondaryMouseClickCallback)
    Control.initialize(self, containingScene, x, y, w, h, primaryMouseClickCallback, secondaryMouseClickCallback)
    self.Text = text
    self.ClickKey = clickKey
    self.CurrentBackColor = Appearance.Themes[Appearance.CurrentTheme].BUTTON_BACK_COLOR
    self.CurrentBorderColor = Appearance.Themes[Appearance.CurrentTheme].BUTTON_BORDER_COLOR
    self.CurrentForeColor = Appearance.Themes[Appearance.CurrentTheme].BUTTON_FORE_COLOR
end

function Button:PersistentUpdate()
    self.CurrentBackColor = Color.TemporalInterpolateRGBColor(CurrentRenderer:HexadecimalColorToRGB(self.CurrentBackColor),
        CurrentRenderer:HexadecimalColorToRGB(
            ((Mouse.IsInside(self.X, self.Y, self.Width, self.Height) and Mouse.IsPrimaryDown()) or
                Keyboard.KeyHeld(self.ClickKey)) and Appearance.Themes[Appearance.CurrentTheme].BUTTON_PUSHED_BACK_COLOR or
                Appearance.Themes[Appearance.CurrentTheme].BUTTON_BACK_COLOR))

    self.CurrentBorderColor = Color.TemporalInterpolateRGBColor(CurrentRenderer:HexadecimalColorToRGB(self.CurrentBorderColor),
        CurrentRenderer:HexadecimalColorToRGB(
            (Mouse.IsInside(self.X, self.Y, self.Width, self.Height) or Keyboard.KeyHeld(self.ClickKey)) and
                Appearance.Themes[Appearance.CurrentTheme].BUTTON_HOVERED_BORDER_COLOR or
                Appearance.Themes[Appearance.CurrentTheme].BUTTON_BORDER_COLOR))
    self.CurrentForeColor = Color.TemporalInterpolateRGBColor(CurrentRenderer:HexadecimalColorToRGB(self.CurrentForeColor),
        CurrentRenderer:HexadecimalColorToRGB(Appearance.Themes[Appearance.CurrentTheme].BUTTON_FORE_COLOR))
end

function Button:Update()

    if Mouse.IsPrimaryClickedInside(self.X, self.Y, self.Width, self.Height) or Keyboard.KeyPressed(self.ClickKey) then
        self.ContainingScene.AddQueuedCallback(self.ContainingScene, self.PrimaryMouseClickCallback, self)
    end

    if Mouse.IsSecondaryClickedInside(self.X, self.Y, self.Width, self.Height) then
        self.ContainingScene.AddQueuedCallback(self.ContainingScene, self.SecondaryMouseClickCallback, self)
    end
end

function Button:Draw()

    CurrentRenderer:FillRectangle(self.CurrentBorderColor,
        self.X - Appearance.Themes[Appearance.CurrentTheme].BORDER_SIZE,
        self.Y - Appearance.Themes[Appearance.CurrentTheme].BORDER_SIZE,
        self.Width + Appearance.Themes[Appearance.CurrentTheme].BORDER_SIZE * 2,
        self.Height + Appearance.Themes[Appearance.CurrentTheme].BORDER_SIZE * 2)
    CurrentRenderer:FillRectangle(self.CurrentBackColor, self.X, self.Y, self.Width, self.Height)

    if (self.Text) then
        CurrentRenderer:DrawText(self.CurrentForeColor, self.Text, self.X + self.Width / 2 -
            Appearance.Themes[Appearance.CurrentTheme].FONT_SIZE / 3 * self.Text:len(), self.Y + self.Height / 2 - 7.5)
    end

end
