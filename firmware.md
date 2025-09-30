
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
