local monitor = peripheral.find("monitor")
local sides = { "top", "bottom", "left", "right",
"front", "back" }


term.redirect(monitor)

for i = 1, #sides do
  if peripheral.isPresent(sides[i]) then
        print("A "..peripheral.getType(sides[i]).." is on the "..sides[i])
  end


end
