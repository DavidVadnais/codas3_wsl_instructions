# Windows11 - Ubuntu - 26.04 - codas3 install
This set of install and debug instructions are for installing CODAS on a Windows11 machine with WSL2 Ubuntu 26.04. We are following the [Setting up CODAS packages](https://currents.soest.hawaii.edu/docs/adcp_doc/codas_setup/anaconda_install/index.html) Ubuntu conda install guide but I am swapping out conda for micromamba.

## Install steps
These install micromamba were pulled from [here](https://mamba.readthedocs.io/en/latest/installation/micromamba-installation.html) on 2025-04-22.
``` bash
# micromamba install
"${SHELL}" <(curl -L micro.mamba.pm/install.sh)
echo ${SHELL} # if you need to find your shell
exec bash 
micromamba activate

# get the codas yaml
# Copy the link from : https://currents.soest.hawaii.edu/docs/adcp_doc/codas_setup/conda_install/index.html
micromamba env create --file codas_processing.yml
micromamba activate pycodas
```
[Download CODAS](https://currents.soest.hawaii.edu/docs/adcp_doc/codas_setup/codas_config/index.html#download-codas-software-using-mercurial)

> **⚠️ Warning**
> Installing in /mnt/c can cause permission problems use ~ if possible

``` bash
# in your working directory
git clone -b stable https://currents.soest.hawaii.edu/git/uh-currents-group/shipboard-adcp/codas3.git
git clone -b stable https://currents.soest.hawaii.edu/git/uh-currents-group/shipboard-adcp/pycurrents.git
git clone -b stable https://currents.soest.hawaii.edu/git/uh-currents-group/shipboard-adcp/onship.git
git clone -b stable https://currents.soest.hawaii.edu/git/uh-currents-group/shipboard-adcp/uhdas.git

```

[Compile and install CODAS parts](https://currents.soest.hawaii.edu/docs/adcp_doc/codas_setup/codas_config/index.html#compile-and-install-codas-components)
``` bash
sudo apt install gcc

# This will cover the waf install. You can also meson install but will get warning [2026-05-19].
cd codas3
./conda-install.sh

```


## Pycurrents
CODAS should now work as desired.  If you just want CODAS you can now go to [2_TESTING.md](2_TESTING.md). Otherwise, if you additionally want the capability of pycurrents (standard):
``` bash
cd pycurrents
# try 
micromamba install cython
pip install . --no-build-isolation

```
While some capability of pycurrents is now available, for most use cases, it is desirable to have topography.
``` bash
mkdir -p ~/adcpcode/topog/etopo
cd ~/adcpcode/topog/etopo
curl -O https://currents.soest.hawaii.edu/downloads/etopo1_for_pycurrents.zip
unzip etopo1_for_pycurrents.zip
ln -s ~/adcpcode/topog ~/micromamba/.
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


*Last run: 2026-05-19 (yyyy-mm-dd)*
