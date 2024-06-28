local recoil = false
local Xstep = {-3,0,5,-4,-7, -8,-5,-6,2,8, 4,0,2,0,-4, -2,-3,4,4,2, 2,3,-4,-5,-5, -2}
local Ystep = {13,13,8,13,21, 14,12,13,11,11, 10,7,10,6,4, 4,2,5,3,6, 4,3,2,2,1, 3}
local Tstep = 55
local capacity = 26

EnablePrimaryMouseButtonEvents(true)


function OnEvent(event, arg)
  OutputLogMessage("event = %s, arg = %d\n", event, arg)


  if (event == "MOUSE_BUTTON_PRESSED" and arg == 6) then
   recoil = not recoil
   OutputLogMessage("recoil = %s\n",recoil)
  end

  if (event == "MOUSE_BUTTON_PRESSED" and arg == 1 and recoil == true) then
    Sleep(4)
    for i=1,capacity do
        if(IsMouseButtonPressed(1)  == false) then
            OutputLogMessage("break\n")
            break
        end
        MoveMouseRelative(Xstep[i],Ystep[i])
        Sleep(Tstep)
    end
    OutputLogMessage("end\n")
  end

end
