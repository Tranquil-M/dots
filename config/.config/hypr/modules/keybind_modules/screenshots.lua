-- Variables
local mainMod = "SUPER"
local ipc = "noctalia msg"

-- Helper funs
local function snap(mode)
	os.execute("mkdir $HOME/Pictures/Screenshots -p")
	local file_path = os.getenv("HOME") .. "/Pictures/Screenshots/Screenshot_" .. os.date("%Y-%m-%d_%H-%M-%S") .. ".png"

	local template = [[
    grimblast copysave %s "%s" && \
    (mpv --volume=65 "$HOME/.config/hypr/sfx/camera-shutter.mp3" &) && \
    res=$(notify-send "Screenshot Captured" "Click to annotate" -i "%s" --wait --action="default=edit") && \
    [ "$res" = "default" ] && satty --filename "%s"
    ]]

	local cmd = string.format(template, mode, file_path, file_path, file_path)

	hl.dispatch(hl.dsp.exec_cmd(cmd))
end

-- Execution
hl.bind(mainMod .. " + z", function()
	snap("area")
end)

hl.bind(mainMod .. " + SHIFT + z", function()
	snap("output")
end)
