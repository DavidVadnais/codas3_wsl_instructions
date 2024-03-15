# Windows10 - Ubuntu - 20.04.01 - codas3 testing

This set of tests are for running codas on a Windows10 machine with WSL2 Ubuntu20.04.01. We are following the [Test the CODAS Python Installation](https://currents.soest.hawaii.edu/docs/adcp_doc/codas_setup/test_it/index.html) guide.

## Prerequisites 
* Windows10 - Ubuntu - 20.04.01 - codas3 install has been followed
* the directory ~/adcpcode/programs/adcp_py3demos/adcp_pyproc exists
* the directory ~/adcpcode/programs/adcp_py3demos/uhdas_data exists

## Tests
```
cd ~/adcpcode/programs/adcp_py3demos/uhdas_data/km1001c/proc/os38nb

showdb adcpdb/a_km
```
The showdb command should come back with a menu like this:
```
DBOPEN DATABASE NAME = adcp_pyproc/km1001c_postproc/os38nb/adcpdb/a_km

BLK:     0   OPEN: 1    PRF:     0   OPEN: 1    IER:      0

1 - Show BLK DIR HDR          10 - SRCH TIME
2 - Show BLK DIR              11 - SRCH BLK/PRF
3 - Show BLK DIR ENTRY        12 - MOVE
4 - Show BLK HDR              13 - GET TIME
5 - Show PRF DIR              14 - GET POS
6 - Show PRF DIR ENTRY        15 - GET DEPTH RANGE
7 - Show DATA LIST            16 - GET DATA
8 - Show DATA DIR             17 - Show Data Present
9 - Show STRUCT DEFN          18 - SHOW BLK FTR
                    99 - QUIT
```
Type 99 to quit

## Test figview
Look at the figures in that directory: Use the arrow keys to select ‘previous’ or ‘next’ figure:
```
figview.py --type png
```

## Test dataviewer
Look at the data with the viewer: To quit, close the control window:
```
dataviewer.py
```
## Additional test (INTERNAL)
This runs our internal test suite.  This section is for UHDAS team members.
```
sudo apt install python3-pytest
# download the pycurrents_test_data repo into ~/adcpcode/programs/ directory

cd ~/adcpcode/programs/pycurrents
./runsetup.py --test_and_log
figview.py ./test_figures
```
