local QM={}

function QM:new(o)
  o=o or {}
  setmetatable(o,self)
  self.__index=self
  return o
end

function QM:init()

end

function QM:cleanup()

end

ss=[[client 0: 'System' [type=kernel]
    0 'Timer           '
    1 'Announce        '
client 14: 'Midi Through' [type=kernel]
    0 'Midi Through Port-0'
client 128: 'Client-128' [type=user,pid=437]
    0 'Virtual RawMIDI ']]

local matched_client=nil
local midi_through=-1
local midi_virtual=-1
for s in ss:gmatch("[^\r\n]+") do
  print(s)
  if string.find(s,"client") then
    client=s:match("client (%d+):")
    name=s:match("'(.+)'")
    matched_client={name=name,client=tonumber(client)}
  elseif matched_client~=nil then
    if string.find(s,"Midi Through") then
      midi_through=matched_client.client
    elseif string.find(s,"Virtual") then
      midi_virtual=matched_client.client

    end
    matched_client=nil
  end
end
print(midi_virtual,midi_through)

return QM
