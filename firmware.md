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

#### 1.Install Docker
```
sudo apt update
sudo apt install docker.io -y
sudo systemctl enable docker --now
sudo usermod -aG docker $USER

```
#### 2. Clone PX4 and checkout v1.15.4
```
git clone https://github.com/PX4/PX4-Autopilot.git --recursive
cd PX4-Autopilot
git checkout v1.15.4
git submodule update --init --recursive
```
#### 3. Build PX4 inside Docker
```
./Tools/docker_run.sh "make px4_fmu-v6x_default"
```
- I had to give permission to Docker first (recommended by DeepSeek)
```
sudo usermod -aG docker $USER
# Then log out and log back in, or run:
newgrp docker
```
- This will install inside this folder
```
build/px4_fmu-v6x_default/px4_fmu-v6x_default.px4
```

#### 4. Flash Firmware
```
make px4_fmu-v6x_default upload
```
