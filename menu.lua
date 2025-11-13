Goofy = Goofy or {}

surface.CreateFont( "Goofy.Title", { font = "Arial", size = ScreenScale(8), weight = 500 })
surface.CreateFont( "Goofy.Text", { font = "Arial", size = ScreenScale(5), weight = 500 })

local list = {}
local function texture(x,y, w,h, mat, col)
	  list[mat] = list[mat] or Material(mat)

	  surface.SetDrawColor( col or color_white )
	  surface.SetMaterial( list[mat] )
	  surface.DrawTexturedRect( x,y, w,h )
end

local function fontSize(text, font)
	  surface.SetFont(font)
	  
	  return surface.GetTextSize(text)
end

function Goofy:Menu(text, bar, icon)
		 local sw,sh = ScrW(),ScrH()
		  
		 local boxw,barh = sw * 0.015, sh * 0.04
		 local gap = sw * 0.001
         local icons = sh * 0.03
         
		 local frame = vgui.Create("DFrame")
		       frame:MakePopup()
		       frame:SetTitle("")
		       frame:ShowCloseButton(false)
			   frame.Paint = function(me, w,h)
					 draw.RoundedBox( 0, 0,0, w,h, Color(25,25,25, 150) )
		 
					 for x=1, w/boxw do
					     for y=1,h/boxw do
					          draw.RoundedBox( 0, math.Round((x-1) * (boxw + gap)),barh + math.Round((y-1) * (boxw + gap)), boxw,boxw, Color(10,10,10, 90) )
					     end
					 end
					 
					 draw.RoundedBox( 0, 0,0, w,barh, Color(60,60,66) )
					 draw.RoundedBox( 0, 0,barh, w,sh * 0.0027, bar )
					 
					 local dis = sw * 0.005
					 if icon then
						dis = sw * 0.03
						draw.RoundedBox( 5, sw * 0.005,(barh - icons)/2, icons,icons, Color(90,90,90) )
						texture(sw * 0.008,(barh - icons * 0.75)/2, icons * 0.75,icons * 0.75, icon, color_white)
					 end
				     
					 draw.SimpleText( text or "No Name", "Goofy.Title", dis,barh/2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
			   end


		function frame:CloseButton()
				 local fw,fh = frame:GetSize()
				
				 local cls = vgui.Create("DButton", frame)
					   cls:SetSize(barh,barh)
					   cls:SetPos(fw - barh,0)
					   cls:SetText("")
					   cls.Paint = function(me, w,h)
						   draw.SimpleText( "X", "Goofy.Title", w/2,sh * 0.022, color_white, TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER )
					   end
					   cls.DoClick = function() frame:Remove() end
		end
		
		function frame:List(side)
		         local fw,fh = frame:GetSize()
				 local mw = 5
				 local fw,fh = frame:GetSize()
				
				 local pan = vgui.Create("DPanel", frame)
					   pan:SetSize(mw, fh - barh)
					   pan.Paint = function(me, w,h)
						   draw.RoundedBox( 0, 0,0, w,h, Color(45,45,45) )
						   draw.RoundedBox( 0, w-sh * 0.0027,0, sh * 0.0027,h, bar )
						   
						   me:SetSize(mw, fh - barh)
						   pan.list:SetSize(w * 0.988,h * 0.98)
					   end
					   
				 pan:SetPos(0,barh * 1.05)

				 
				 local pw,ph = pan:GetSize()
				 
				 pan.list = vgui.Create("DScrollPanel", pan)
				 pan.list:SetSize(pw * 0.988,ph * 0.98)
			
				 function pan:addButton(text, func, icon)
						  local btn = pan.list:Add( "DButton" )
							    btn:SetText( "" )
								btn:SetSize(mw, (icon and fh * 0.15 or fh * 0.07))
							    btn:Dock( TOP )
							    btn:DockMargin( 0, 0, 0, 5 )
							    btn.Paint = function(me, w,h)
								    if icon then
									   local si = w * 0.425
									
									   texture((w-si)/2,h * 0.2, si,si, icon, color_white)
									   draw.SimpleText( text, "Goofy.Text", w/2,h * 0.75, color_white, TEXT_ALIGN_CENTER )
									  else
									   draw.SimpleText( text, "Goofy.Text", w/2,h/2, color_white, TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER )
								    end
							    end
								
						  local tw,th = fontSize(text, "Goofy.Text")
							 if tw > mw then mw = tw * (icon and 2 or 1.5) end
				 end
			
			return pan
		end
		
	return frame
end
	   
