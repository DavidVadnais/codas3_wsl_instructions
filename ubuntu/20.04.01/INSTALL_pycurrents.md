# Windows10 - Ubuntu - 20.04.01 - pycurrents install
*Problem 1:*
```
 python3 ./runsetup.py --sudo
Traceback (most recent call last):
  File "./runsetup.py", line 51, in <module>
    from setup_helper import (find_codasbase,
  File "/home/dvadnais/adcpcode/programs/pycurrents/setup_helper.py", line 32, in <module>
    raise RuntimeError("Cannot find a 'pip' co-located with the running python.")
RuntimeError: Cannot find a 'pip' co-located with the running python.
```
*Solution 1:*
There is probably a better way but for now change the file ```~/adcpcode/programs/pycurrents/setup_helper.py``` line ```pip_cmd = find_executable(['pip3', 'pip'])``` to ```pip_cmd = "/home/$USER/.local/bin/pip"```

```
sed -i 's/find_executable(['pip3', 'pip'])/"\/home\/dvadnais\/.local\/bin\/pip"/g' ~/adcpcode/programs/pycurrents/setup_helper.py
```
*Problem 2:*
Modules not installing as expected
*Solution 2:*
```
pip install PyQt5 qtconsole
```
*Problem 3:*
figview is crashing
```
figview.py --type png
WARNING: CPU random generator seem to be failing, disabling hardware random number generation
WARNING: RDRND generated: 0xffffffff 0xffffffff 0xffffffff 0xffffffff
qt.qpa.plugin: Could not load the Qt platform plugin "xcb" in "" even though it was found.
This application failed to start because no Qt platform plugin could be initialized. Reinstalling the application may fix this problem.

Available platform plugins are: eglfs, linuxfb, minimal, minimalegl, offscreen, vnc, wayland-egl, wayland, wayland-xcomposite-egl, wayland-xcomposite-glx, webgl, xcb.

Aborted
```
*Solution 3:*
```
sudo apt-get update
sudo apt-get -y install libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-render-util0
sudo apt-get install --reinstall libxcb-xinerama0
```
*Help 3:*

You may be missing more or fewer libraries. To explore this issue look at the errors after you run the below commands.
```
export QT_DEBUG_PLUGINS=1

cd ~/adcpcode/programs/adcp_py3demos/uhdas_data/km1001c/proc/os38nb
figview.py --type png
```

## Installation
[Compile and install CODAS parts](https://currents.soest.hawaii.edu/docs/adcp_doc/codas_setup/codas_config/index.html#compile-and-install-codas-components)

```
cd ~/adcpcode/programs/pycurrents
python3 ./runsetup.py --sudo
cd ../uhdas
python3 runsetup.py --sudo
cd ../onship
python3 setup.py build
sudo python3 setup.py install
cd ~
```
[Download documentation and processing demo directories](https://currents.soest.hawaii.edu/docs/adcp_doc/codas_setup/codas_config/index.html#download-documentation-and-processing-demo-directories)

You may need to install unzip.
```
cd ~/adcpcode/programs
curl -O https://currents.soest.hawaii.edu/docs/zipped/adcp_doc.zip
unzip adcp_doc.zip
curl -O https://currents.soest.hawaii.edu/docs/zipped/adcp_py3demos.zip
unzip adcp_py3demos.zip
```

[Download and install Topography files](https://currents.soest.hawaii.edu/docs/adcp_doc/codas_setup/codas_config/index.html#download-and-install-topography-files)
```
cd ~/adcpcode/topog
mkdir etopo
cd etopo
curl -O ftp://currents.soest.hawaii.edu/pub/outgoing/etopo1_for_pycurrents.zip
unzip etopo1_for_pycurrents.zip

cd /usr/local
sudo ln -s  ~/adcpcode/topog .
cd
```
[Install the “toml” library](https://currents.soest.hawaii.edu/docs/adcp_doc/codas_setup/codas_config/index.html#install-the-toml-library)
```
sudo pip3 install toml
```
