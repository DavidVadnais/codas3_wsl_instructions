# Windows10 - Ubuntu - 20.04.01 - codas3 install
This set of install and debug instructions are for installing codas on a Windows10 machine with WSL2 Ubuntu 20.04.01. We are following the [Setting up CODAS packages](https://currents.soest.hawaii.edu/docs/adcp_doc/codas_setup/codas_config/index.html) Ubuntu native install guide.

## Windows specific solutions
This is the CLI solutions to the problems with running CODAS.  To see more details go to the problems section.
``` bash
sudo ln -s /usr/bin/python3 /usr/bin/python
```

## Install steps
[Download CODAS](https://currents.soest.hawaii.edu/docs/adcp_doc/codas_setup/codas_config/index.html#download-codas-software-using-mercurial)
``` bash
mkdir ~/adcpcode
mkdir ~/adcpcode/programs
mkdir ~/adcpcode/topog

cd ~/adcpcode/programs
hg clone   https://currents.soest.hawaii.edu/hg/codas3
hg clone   https://currents.soest.hawaii.edu/hg/pycurrents
hg clone   https://currents.soest.hawaii.edu/hg/onship
hg clone   https://currents.soest.hawaii.edu/hg/uhdas
```
[Compile and install CODAS parts](https://currents.soest.hawaii.edu/docs/adcp_doc/codas_setup/codas_config/index.html#compile-and-install-codas-components)

``` bash
cd ~/adcpcode/programs/codas3
./waf configure
./waf build
sudo ./waf install
cd ~
```
## Next steps
If you additionally want the capability of pycurrents (standard) go to [INSTALL_pycurrents.md](INSTALL_pycurrents.md).

If you just want the capability of CODAS you can go straight to [TESTING.md](TESTING.md).

## Problems
### Problem 1:
``` bash
sudo ./waf install
/usr/bin/env: ‘python’: No such file or directory
```
### Solution 1:
``` bash
sudo ln -s /usr/bin/python3 /usr/bin/python
```

*Last run: 2024-03-15 (yyyy-mm-dd)*