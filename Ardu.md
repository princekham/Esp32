###
- Firmware: (https://firmware.ardupilot.org/Copter/stable-4.6.2/Pixhawk6X/)

#### Frame Type

<img width="1183" height="371" alt="image" src="https://github.com/user-attachments/assets/73d698d5-8902-4fcb-83e9-ded8db0cc97c" />


###
- setting up the voltage divider (under battery monitor - pin ကတော့ ‌ရွေးထားပြီးပြီလို့တော့့ပြောတယ်)
- BATT_I2C_ADDR = 65 (For Low voltage (6S) Digital Power Module),= 69 (For High Voltage (12S/14S) Digital Power Module)
- BATT_I2C_ADDR = 69 ေပြာင်းထားရမယ်

- cygiconv-2.dll
- cygiconv-8.dll
- They can be downloaded at (https://firmware.ardupilot.org/Tools/MissionPlanner/sitl/)

Run the simulator
Open a command prompt in the C:\ardu-sim folder and run the below code:
```
arducopter -w -S --model + --speedup 1 --defaults parameters/copter.parm -I0
```
Open another command prompt in the C:\ardu-sim folder and run the below code:

```
mavproxy --master tcp:127.0.0.1:5760 --out 127.0.0.1:14550 --out 127.0.0.1:14560 --daemon --no-console --non-interactive
```

Open Mission Planner and connect to the UDP port 14550 or run the below code in another command prompt started in the C:\ardu-sim folder:

```
mavproxy --master=127.0.0.1:14550
```

### LUA Scripts
- https://raw.githubusercontent.com/ArduPilot/ardupilot/master/libraries/AP_Scripting/docs/docs.lua

#### Switch value
- LOW = 0
- MEDIUM = 1
- HIGH = 2

#### Enable LUA scripts
- Enable "SCR_ENABLE"

### MAV Proxy command
- to reboot vehicle
  ``` reboot ```
- to restart the scripting enging
  ``` scripting restart```
- to show parameters
  ```param show RC*_OPTION```
- to set RC option, eg:
  ```param set RC6_OPTION 300```
  
