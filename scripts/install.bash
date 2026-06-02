#!/bin/bash

set -euo pipefail 

# TODO Test this utility scripts 

INSTALL_DIR="${1:-$HOME}"

echo "Have you already installed conda/the libraries?"
echo "  yes  - continue with the rest of the script"
echo "  no   - quit"
echo "  info - show the setup steps and exit"
read -rp "> " _setup_choice
case "$_setup_choice" in
    [Yy]|yes|YES)
        ;;
    info|INFO)
        echo ""
        echo "--- micromamba setup steps (not running) ---"
        echo '"${SHELL}" <(curl -L micro.mamba.pm/install.sh)'
        echo 'echo ${SHELL}'
        echo 'exec ${SHELL}'
        echo 'micromamba activate'
        echo ''
        echo '# Copy the yaml from : https://currents.soest.hawaii.edu/docs/adcp_doc/codas_setup/conda_install/index.html'
        echo 'micromamba env create --file codas_processing.yml'
        echo 'micromamba activate pycodas'
        echo 'micromamba install cython'
        echo "--------------------------------------------"
        exit 0
        ;;
    *)
        echo "Quitting."
        exit 0
        ;;
esac

## clone repos
read -rp "Clone repos into $INSTALL_DIR? [y/n]: " _clone_choice
if [[ "$_clone_choice" =~ ^[Yy]$ ]]; then
    cd "${INSTALL_DIR}"
    git clone -b stable https://currents.soest.hawaii.edu/git/uh-currents-group/shipboard-adcp/codas3.git
    git clone -b stable https://currents.soest.hawaii.edu/git/uh-currents-group/shipboard-adcp/pycurrents.git
    git clone -b stable https://currents.soest.hawaii.edu/git/uh-currents-group/shipboard-adcp/onship.git
    git clone -b stable https://currents.soest.hawaii.edu/git/uh-currents-group/shipboard-adcp/uhdas.git
fi


## Install

# codas
cd "${INSTALL_DIR}"/codas3
./conda-install.sh

# Pycurrents
cd "${INSTALL_DIR}"/pycurrents
pip install . --no-build-isolation

mkdir -p "$INSTALL_DIR/adcpcode/topog/etopo"
cd "$INSTALL_DIR/adcpcode/topog/etopo"
curl -O https://currents.soest.hawaii.edu/downloads/etopo1_for_pycurrents.zip
unzip etopo1_for_pycurrents.zip
ln -s "$INSTALL_DIR/adcpcode/topog" "${HOME}/micromamba/."

# uhdas
cd "${INSTALL_DIR}"/uhdas
pip install .
cd "${INSTALL_DIR}"/onship # assumes you placed all repos side by side
pip install .


