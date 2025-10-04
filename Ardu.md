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
mavproxy --master tcp:127.0.0.1:5760 --out 192.168.100.11:14550 --out 192.168.100.11:14560 --daemon --no-console --non-interactive

```
- I use the following to run the simulation
- 
```
sim_vehicle.py -v ArduCopter --no-mavproxy --sysid 100

# Build once explicitly
./waf configure --board sitl
./waf copter

# Then run without auto-rebuild
sim_vehicle.py -v ArduCopter --no-mavproxy --sysid 100 --no-rebuild


source droneswarm/bin/activate
mavproxy.py --master=tcp:127.0.0.1:5760 --sitl=127.0.0.1:5501 --out udp:192.168.100.11:14550 


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
- to set Switch value 
  ```rc 6 1500 ```
- to show Servo Function
  ```param show SERVO*_FUNCTION ```
- to show relay
  ``` param show RELAY*_PIN ```
- to load graph
  ```module load graph```
  ```graph SERVO_OUTPUT_RAW.servo8_raw ```

### Functions
- get_aux_switch_pos () (returns integer 0, 1, 2)
- get_pwm (returns the RC input PWM value given a channel number. Note that channel here is indexed from 1. Returns nill if channel is not available.)
- set_output_pwm (-- Set the pwm for a given servo output function
---@param function_num integer -- servo function number (See SERVOx_FUNCTION parameters)
---@param pwm integer -- pwm value
function SRV_Channels:set_output_pwm(function_num, pwm) end)
  
