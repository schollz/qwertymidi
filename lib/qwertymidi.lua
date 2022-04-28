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

return QM