
Appearance = {
    Themes = {
        Classic = {
            WINDOW_BACK_COLOR = "#F0F0F0",
            BUTTON_BORDER_COLOR = "#B0B0B0",
            BUTTON_BACK_COLOR = "#E1E1E1",
            BUTTON_FORE_COLOR = "#000000",
            BUTTON_HOVERED_BORDER_COLOR = "#0078D7",
            BUTTON_PUSHED_BACK_COLOR = "#C5E1F7",
            TEXTBOX_BACK_COLOR = "#FFFFFF",
            TEXTBOX_READONLY_BACK_COLOR = "#F0F0F0",
            TEXTBOX_BORDER_COLOR = "#7A7A7A",
            TEXTBOX_HOVERED_BORDER_COLOR = "#171717",
            TEXTBOX_ACTIVE_BORDER_COLOR = "#0078D7",
            SLIDER_TRACK_COLOR = "#E7EAEA",
            SLIDER_HEAD_COLOR = "#0078D7",
            SLIDER_PRESSED_HEAD_COLOR = "#CCCCCC",
            SLIDER_HOVERED_HEAD_COLOR = "#171717",
            JOYSTICK_LINE_COLOR = "#E50000",
            JOYSTICK_TIP_COLOR = "#0000E5",
            JOYSTICK_TIP_SIZE = 8,
            SLIDER_HEAD_WIDTH = 8,
            SLIDER_HEAD_HEIGHT = 16,
            SLIDER_TRACK_HEIGHT = 2,
            CARROUSEL_BUTTON_CHEVRON_WIDTH = 21,
        },
        Dark = {
            WINDOW_BACK_COLOR = "#202020",
            BUTTON_BORDER_COLOR = "#B0B0B0",
            BUTTON_BACK_COLOR = "#292929",
            BUTTON_FORE_COLOR = "#FFFFFF",
            BUTTON_HOVERED_BORDER_COLOR = "#0078D7",
            BUTTON_PUSHED_BACK_COLOR = "#4A4A4A",
            TEXTBOX_BACK_COLOR = "#111111",
            TEXTBOX_READONLY_BACK_COLOR = "#292929",
            TEXTBOX_BORDER_COLOR = "#7A7A7A",
            TEXTBOX_HOVERED_BORDER_COLOR = "#171717",
            TEXTBOX_ACTIVE_BORDER_COLOR = "#0078D7",
            SLIDER_TRACK_COLOR = "#E7EAEA",
            SLIDER_HEAD_COLOR = "#0078D7",
            SLIDER_PRESSED_HEAD_COLOR = "#CCCCCC",
            SLIDER_HOVERED_HEAD_COLOR = "#171717",
            JOYSTICK_LINE_COLOR = "#00FF08",
            JOYSTICK_TIP_COLOR = "#FF0000",
            JOYSTICK_TIP_SIZE = 8,
            SLIDER_HEAD_WIDTH = 8,
            SLIDER_HEAD_HEIGHT = 16,
            SLIDER_TRACK_HEIGHT = 2,
            CARROUSEL_BUTTON_CHEVRON_WIDTH = 21,
        },
        Inverted = {
            -- Autogenerated
        }
    },
    CurrentTheme = "Classic"
}



VERTICAL_SAFE_ZONE = 30
HORIZONTAL_SAFE_ZONE = 3
FONT_SIZE = 10
BORDER_SIZE = 1


function Appearance.SetTheme(theme)
    Appearance.CurrentTheme = theme
end

function Appearance.Initialize()
    Appearance.Themes.Inverted = Table.Copy(Appearance.Themes.Classic)

    for k, v in pairs(Appearance.Themes.Inverted) do
        if (type(v) == "string") then
            local rgb = WGUI.HexadecimalColorToRGB(Appearance.Themes.Inverted[k]);
            rgb[1] = 255 - rgb[1]
            rgb[2] = 255 - rgb[2]
            rgb[3] = 255 - rgb[3]
            Appearance.Themes.Inverted[k] = WGUI.RGBToHexadecimalColor(rgb)
        end
    end
end


