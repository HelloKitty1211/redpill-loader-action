#!/bin/bash

# prepare build tools
sudo apt-get update && sudo apt-get install --yes --no-install-recommends ca-certificates build-essential git libssl-dev curl cpio bspatch vim gettext bc bison flex dosfstools kmod jq

root=`pwd`
mkdir DS3615xs-7.0.1
mkdir output
cd DS3615xs-7.0.1

# sudo git clone https://github.com/tossp/redpill-tool-chain.git
sudo git clone https://github.com/guigeng/redpill-helper.git
ls -l

cd redpill-helper
# sudo cp -a sample_user_config.json bromolow_user_config.json
ls -l
# sudo ./redpill_tool_chain.sh add https://raw.githubusercontent.com/pocopico/rp-ext/main/r8168/rpext-index.json
# sudo ./redpill_tool_chain.sh build bromolow-7.0.1-42218
# sudo ./redpill_tool_chain.sh auto bromolow-7.0.1-42218
sudo ./rp-helper.sh ext bromolow-7.0.1-42218 add https://raw.githubusercontent.com/pocopico/rp-ext/main/r8168/rpext-index.json
sudo ./rp-helper.sh build bromolow-7.0.1-42218
sudo ./rp-helper.sh auto bromolow-7.0.1-42218
ls images -l
sudo mv images/redpill-DS3615xs_7.0.1-42218*.img ${root}/output/
cd ${root}
