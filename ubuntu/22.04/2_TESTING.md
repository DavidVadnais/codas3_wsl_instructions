# Windows10 - Ubuntu - 22.04 - pycurrents install
## Prerequisites 
* Windows10 - Ubuntu - 22.04 - codas3 install has been followed. [1_INSTALL_codas.md](1_INSTALL_codas.md)

## Test Data
Get the test data: 
``` bash
curl -O https://currents.soest.hawaii.edu/docs/zipped/codas_demos.zip
unzip codas_demos.zip
```

## Test CODAS
``` bash
cd codas_demos/adcp_pyproc/km1001c_uhdas/os38nb/adcpdb
showdb aship
```
The `showdb` command should come back with a menu like this:
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

## Test pycurrents
### figview.py
``` bash
cd codas_demos/adcp_pyproc/km1001c_uhdas/os38nb/webpy
figview.py --type png
```
This should look like [fig_view_example.PNG](example_images/fig_view_example.PNG)

### dataviewer.py
*Note: you need topo for this*
``` bash
cd codas_demos/adcp_pyproc/km1001c_uhdas/os38nb
dataviewer.py
```
This should look like [data_viewer_example.PNG](example_images/data_viewer_example.PNG)

*Last run: 2025-04-22 (yyyy-mm-dd)*
