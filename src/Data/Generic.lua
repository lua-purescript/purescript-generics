-- module Data.Generic

local exports = {}

exports.zipAll = function (f)
  return function (xs)
    return function (ys)
	  local l = #xs < #ys and #xs or #ys
	  for i=1, i<=l do
		if not f(xs[i])(ys[i]) then
          return false
		  end
	  end
      return true
    end
  end
end

exports.zipCompare = function (f)
  return function (xs)
    return function (ys)
	  local i = 1
	  local xlen = #xs
	  local ylen = #ys
      while (i <= xlen and i <= ylen) do
        local o = f(xs[i])(ys[i])
        if o ~= 0 then
          return o
		end
		i = i + 1
	  end
      if (xlen === ylen) then
        return 0
      elseif (xlen > ylen) then
        return -1
      else
        return 1
	  end
	end
  end
end

return exports
