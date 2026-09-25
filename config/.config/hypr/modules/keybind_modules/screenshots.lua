-- Variables
local mainMod = "SUPER"
local ipc = "noctalia msg"

-- Execution
hl.bind(mainMod .. " + z", function()
	local file_path = os.getenv("HOME") .. "/Pictures/Screenshots/Screenshot_" .. os.date("%Y-%m-%d_%H-%M-%S") .. ".png"

	local cmd = "grimblast save area "
		.. file_path
		.. " && mpv "
		.. os.getenv("HOME")
		.. "/.config/hypr/sfx/camera-shutter.mp3 && notify-send 'Screenshot Taken' 'Saved to Pictures' -i "
		.. file_path

	hl.dispatch(hl.dsp.exec_cmd(cmd))
end)

hl.bind(
	mainMod .. " + SHIFT + z",
	hl.dsp.exec_cmd(ipc .. " plugin alexander/screen-toolkit:service all annotateFullscreen")
)
