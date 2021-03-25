--[[
Jérémy (Polunga) Pinson
PayDay2 faster drill mod
]]--
--TimerGui:set_timer_multiplier(multiplier)

BeardLib.Utils.Sync = BeardLib.Utils.Sync or {}
local Sync = BeardLib.Utils.Sync

local go_fast_song
local windows_song
local if_go_fast_is_start = false

Hooks:PostHook( Drill, "start", "message_when_drill_start", function(self)
	if if_go_fast_is_start then
		self._unit:timer_gui()["_current_timer"] = 15
		self._unit:timer_gui()["_can_jam"] = false
		managers.chat:_receive_message(1,"SANIC", "drill go fast", Color.blue)
	end
end)

if blt.xaudio then
	blt.xaudio.setup()
	go_fast_song = XAudio.Buffer:new(ModPath .. "data/gotagofast.ogg")
	--windows_song = XAudio.Buffer:new(ModPath .. "data/Windows_XP.ogg")
end
--[[
function PlayerManager:__play_windows()
	if windows_song then
		XAudio.Source:new(windows_song)
		log("play_windows_song")
	end
	return
end
]]--
function PlayerManager:__play_gota_go_fast()
	if go_fast_song then
		XAudio.Source:new(go_fast_song)
		log("play_go_fast_song")
	end
	return
end

function PlayerManager:__enable_fast_drill()
	if if_go_fast_is_start == true then
		if_go_fast_is_start = false
		managers.chat:_receive_message(1,"SANIC", "gotta go slow", Color.green)
		--self:__play_windows()
	else
		if_go_fast_is_start = true
		managers.chat:_receive_message(1,"SANIC", "gotta go fast", Color.blue)
		self:__play_gota_go_fast()
	end
	return
end