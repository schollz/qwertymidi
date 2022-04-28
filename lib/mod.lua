local mod=require 'core/mods'
local qwertymidi=include('qwertymidi/lib/qwertymidi')

local state={
}

mod.hook.register("script_pre_init","qwertymidi mod setup",function()
  params:add_group("QWERTYMIDI",1)
end)

mod.hook.register("script_post_cleanup","qwertymidi mod cleanup",function()

end)


local m={}

m.key=function(n,z)
  if n==2 and z==1 then
    -- return to the mod selection menu
    mod.menu.exit()
  end
  mod.menu.redraw()
end

m.enc=function(n,d)
  mod.menu.redraw()
end

m.redraw=function()
  screen.clear()
  screen.move(12,12)
  screen.text("1. add virtual as device in SYSTEM > DEVICES > MIDI")
  screen.move(24,12)
  screen.text("2. in script, select 'virtual' as midi device")
  screen.update()
end

m.init=function()
end -- on menu entry, ie, if you wanted to start timers

m.deinit=function() end -- on menu exit

mod.menu.register(mod.this_name,m)

local api={}

api.get_state=function()
  return state
end

return api

