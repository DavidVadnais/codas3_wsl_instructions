# codas3_wsl_instructions
For information on [Common Ocean Data Access System (CODAS)](https://currents.soest.hawaii.edu/hg/codas3/) and University of Hawaii Data Acquisition System (UHDAS) see https://currents.soest.hawaii.edu/docs/adcp_doc/index.html 

This repo was created because there is sometimes a desire to install codas3 using Windows Subsystem Linux (WSL2).  UHDAS does not officially support this however for convenience [David Vadnais](https://currents.soest.hawaii.edu/home/people/) has tested this capability here. 

## Prerequisites
* Install WSL2
* Choose a distro
* See tested distros.
* Install mercurial
* Install python3
* Install unzip

## Tested Linux Distributions
### Windows 10
* Ubuntu - 20.04
    * Python version 3.10.12
* Ubuntu - 22.04
    * Python version 3.11.12 

### Windows 11
* Ubuntu - 24.04
    * Python version 3.11.12

## Test hardware
One or more of the following machines was used to test each scenario. See test_machine.txt for details.

Machine 1
* CPU: AMD Ryzen 7 3800X 8-core Processor
* Memory: 32 GB
* GPU: AMD Radeon RX 5700 XT
* Disk: Samsung SSD 970 EVO 1TB

Machine 2
* CPU: 12th Gen Intel(R) Core(TM) i7-12650H
* Memory: 32 GB
* GPU: NVIDIA GeForce RTX 4060 Laptop GPU
* Disk: Micron_2400_MTFDKBA1T0QFM
