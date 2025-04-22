# Windows11 - Ubuntu - 24.04 - codas3 install
This set of install and debug instructions are for installing CODAS on a Windows11 machine with WSL2 Ubuntu 24.04. We are following the [Setting up CODAS packages](https://currents.soest.hawaii.edu/docs/adcp_doc/codas_setup/anaconda_install/index.html) Ubuntu conda install guide but I am swapping out conda for micromamba.

## Install steps
These install micromamba were pulled from [here](https://mamba.readthedocs.io/en/latest/installation/micromamba-installation.html) on 2025-04-22.
``` bash
# micromamba install
"${SHELL}" <(curl -L micro.mamba.pm/install.sh)
echo ${SHELL} # if you need to find your shell
exec bash 
micromamba activate

# get the codas yaml
wget https://currents.soest.hawaii.edu/docs/adcp_doc/_downloads/1bbf9fe7142be462ef441b63cd6587a5/codas_processing_intel.yml
micromamba env create --file codas_processing_intel.yml
micromamba activate pycodas
```
[Download CODAS](https://currents.soest.hawaii.edu/docs/adcp_doc/codas_setup/codas_config/index.html#download-codas-software-using-mercurial)

> **⚠️ Warning**
> Installing in /mnt/c can cause permission problems use ~ if possible

``` bash
# in your working directory
hg clone   https://currents.soest.hawaii.edu/hg/codas3
hg clone   https://currents.soest.hawaii.edu/hg/pycurrents
hg clone   https://currents.soest.hawaii.edu/hg/onship
hg clone   https://currents.soest.hawaii.edu/hg/uhdas
```

[Compile and install CODAS parts](https://currents.soest.hawaii.edu/docs/adcp_doc/codas_setup/codas_config/index.html#compile-and-install-codas-components)
``` bash
sudo apt install gcc

# requires system python
cd codas3
./waf configure
./waf build
sudo ./waf install

# if you dont have system python 
export MY_USER=$(whoami)
sudo env PATH="${PATH}:/home/${MY_USER}/micromamba/envs/pycodas/bin" ./waf install
```


## Pycurrents
CODAS should now work as desired.  If you just want CODAS you can now go to [2_TESTING.md](2_TESTING.md). Otherwise, if you additionally want the capability of pycurrents (standard):
``` bash
cd pycurrents
# try 
pip install .

# if it fails (see above warning)
rm setup_helper.py
ln -s pycurrents/setup_helper.py setup_helper.py
micromamba install toml
pip install . 
cd -
```
While some capability of pycurrents is now available, for most use cases, it is desirable to have topography.
``` bash
cd ~/adcpcode/topog
mkdir etopo
cd etopo
curl -O ftp://currents.soest.hawaii.edu/pub/outgoing/etopo1_for_pycurrents.zip
unzip etopo1_for_pycurrents.zip
ln -s ${FULL_PATH}topog ~/micromamba/.
```

## UHDAS
CODAS and pycurrents should now work as desired.  If you just want these tools you can now go to [2_TESTING.md](2_TESTING.md). Otherwise, if you additionally want the capability of UHDAS (standard):
``` bash
cd uhdas
pip install .
cd ../onship # assumes you placed all repos side by side
pip install .
```

## Next steps
Test your install with instructions [2_TESTING.md](2_TESTING.md).

Learn about [processing](https://currents.soest.hawaii.edu/docs/adcp_doc/codas_doc/index.html), [operations](https://currents.soest.hawaii.edu/docs/adcp_doc/UHDAS_OPERATIONS/index.html), [data](https://currents.soest.hawaii.edu/docs/adcp_doc/ADCP_INTERPRETATION/index.html) or whatever capability you desire by reading the docs. 


*Last run: 2025-04-22 (yyyy-mm-dd)*