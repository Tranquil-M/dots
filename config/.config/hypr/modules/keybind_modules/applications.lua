-- Variables
local mainMod = "SUPER"
local ipc = "noctalia msg"

-- Apps
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("kitty"))

-- Noctalia
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(ipc .. " panel-toggle wallpaper"))
hl.bind(mainMod .. "+ SHIFT + E", hl.dsp.exec_cmd(ipc .. " panel-toggle noctalia/mpvpaper:picker"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd(ipc .. " panel-toggle launcher /emo "))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(ipc .. " panel-toggle clipboard"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(ipc .. " panel-toggle control-center media"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(ipc .. " panel-toggle control-center calendar"))
hl.bind("ALT + Tab", hl.dsp.exec_cmd(ipc .. " window-switcher"))
