lib.addRadialItem(
    { id ="vehicle_menu",
     icon ="car",
     label ="Vozidlo",
     menu = "vehicle_s",
     keepOpen = true

    }
)


lib.registerRadial({
id = "vehicle_s",
items = {
    {
        icon = "oil-can",
        label = "Vypnout/Zapnout Motor",
        onSelect = function ()
            ToggleEngine()
        end

    },
    {
        icon = "car-side",
        label = "Dveře",
        menu = "doors"
    },
    {
        icon = "car-side",
        label = "Okna",
        menu = "windows",
    },
    {
        icon = "chair",
        label = "Sedadla",
        menu = "seats",
    }
}

})
lib.registerRadial({
    
    id ="doors",
    items ={
        {icon = "car-side",
        label = "Kapota",
        onSelect = function ()
            ToggleDoors(4)
        end},
        {icon = "car-side",
        label = "Kufr",
        onSelect = function ()
            ToggleDoors(5)
        end},
        {icon = "car-side",
        label = "Řidič",
        onSelect = function ()
            ToggleDoors(0)
        end},
        {icon = "car-side",
        label = "Spolujezdec",
        onSelect = function ()
            ToggleDoors(1)
        end},
        {icon = "car-side",
        label = "Levé zadní",
        onSelect = function ()
            ToggleDoors(2)
        end},
        {icon = "car-side",
        label = "Pravé zadní",
        onSelect = function ()
            ToggleDoors(3)
        end},
        {icon = "car",
        label = "Všechny",
        onSelect = function ()
            for i = 1, 5 do
                ToggleDoors(i)
            end
            
            
          
        end},





}

})

lib.registerRadial({
    id = "windows",
    items ={
        {
            icon = "car-side",
            label = "Řidič",
            onSelect = function ()
                ToggleWindow(0,0)
            end
        },
        {
            icon = "car-side",
            label = "Spolujezdec",
            onSelect = function ()
                ToggleWindow(1,1)
            end
        },
        {
            icon = "car-side",
            label = "Levé zadní",
            onSelect = function ()
                ToggleWindow(2,2)
            end
        },
        {
            icon = "car-side",
            label = "Pravé zadní",
            onSelect = function ()
                ToggleWindow(3,3)
            end
        },
        {
            icon = "car-side",
            label = "Pravé zadní",
            onSelect = function ()
                for i = 0, 3  do
                    ToggleWindow(i,i)
                end
                
            end
        },
    }
})
 lib.registerRadial({
    id = "seats",
    items ={
        {
            icon = "chair",
            label = "Řidič",
            onSelect = function ()
                
            end
        }
    }
 })

function ToggleEngine()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(),false)
    if GetIsVehicleEngineRunning(vehicle) then
        SetVehicleEngineOn(
	 vehicle--[[ Vehicle ]], 
	true --[[ boolean ]], 
	false --[[ boolean ]], 
	true--[[ boolean ]]
)
else
    SetVehicleEngineOn(
        vehicle--[[ Vehicle ]], 
       false --[[ boolean ]], 
       false --[[ boolean ]], 
       true--[[ boolean ]]
   )
    end

end
function ToggleDoors(doorindex)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(),false)
    
    if GetVehicleDoorAngleRatio(vehicle,doorindex) > 0.0 then
        SetVehicleDoorShut(vehicle,doorindex,false)
    else 
        SetVehicleDoorOpen(vehicle,doorindex,false,false)
        
    end
    
end
function ToggleWindow(door,window)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(),false)
    local numDoors = GetNumberOfVehicleDoors(vehicle)

    if door >= 0 and door < numDoors then
        local isWindowIntact = IsVehicleWindowIntact(vehicle, window)
        
        if isWindowIntact then
            RollDownWindow(vehicle, window)
        else
            RollUpWindow(vehicle, window)
        end
    end 
end
function changeSeat(seat) -- Check seat is empty and move to it
    local ped =PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped,false)
    if (IsVehicleSeatFree(vehicle, seat)) then
        SetPedIntoVehicle( ped,vehicle, seat)
    end
end