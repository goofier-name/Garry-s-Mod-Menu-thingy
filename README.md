Goofy UI Framework - Function Usage Guide
============================================

1. Goofy:Menu(text, bar, icon)
   - Creates a custom window (menu).
   - Parameters:
       text = Title of the menu.
       bar  = Color of the top bar (Color(r, g, b)).
       icon = (Optional) Path to an icon image.
   - Returns: The created frame (menu window).

2. frame:CloseButton()
   - Adds a close button (X) to the menu.

3. frame:List(side)
   - Creates a panel on the side of the menu to hold buttons.
   - Returns: The created list panel.

4. list:addButton(text, func, icon)
   - Adds a clickable button to the list panel.
   - Parameters:
       text = Text shown on the button.
       func = Function to run when clicked.
       icon = (Optional) Path to an icon image.

Usage Example:
---------------
local men = Goofy:Menu("Example Menu", Color(255, 0, 0), "path/to/icon.png")
men:SetSize(ScrW()/2, ScrH()/2)
men:Center()
men:CloseButton()

local list = men:List()
list:addButton("Button 1", function() print("Clicked 1") end, "path/to/icon.png")
list:addButton("Button 2", function() print("Clicked 2") end)
