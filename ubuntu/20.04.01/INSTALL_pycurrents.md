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

[Compile and install CODAS parts](https://currents.soest.hawaii.edu/docs/adcp_doc/codas_setup/codas_config/index.html#compile-and-install-codas-components)

```
cd ~/adcpcode/programs/codas3
./waf configure
./waf build
sudo ./waf install
cd ~

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
