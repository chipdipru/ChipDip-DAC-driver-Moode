#!/bin/sh

echo "Installing ChipDip DACs..."

cp /volumio/ChipDipDACs/chipdip-i2s-master-dac.dtbo /boot/overlays/chipdip-i2s-master-dac.dtbo
cp /volumio/ChipDipDACs/./RasGPIOCtrl_v5 /volumio/app/plugins/system_controller/i2s_dacs/scripts/./RasGPIOCtrl_v5
cp /volumio/ChipDipDACs/chipdip-dac-init.sh /volumio/app/plugins/system_controller/i2s_dacs/scripts/chipdip-dac-init.sh
chmod +x /volumio/app/plugins/system_controller/i2s_dacs/scripts/./RasGPIOCtrl_v5
chmod +x /volumio/app/plugins/system_controller/i2s_dacs/scripts/chipdip-dac-init.sh
sed -i '4 a {"id":"chipdip-master-dac","name":"CHIPDIP Master DAC","overlay":"chipdip-i2s-master-dac","alsanum":"2","mixer":"","modules":"","script":"chipdip-dac-init.sh","needsreboot":"yes"},' /volumio/app/plugins/system_controller/i2s_dacs/dacs.json
sed -i '5 a {"id":"chipdip-slave-dac","name":"CHIPDIP Slave DAC","overlay":"hifiberry-dac","alsanum":"2","mixer":"","modules":"","script":"chipdip-dac-init.sh","needsreboot":"yes"},' /volumio/app/plugins/system_controller/i2s_dacs/dacs.json

echo "Reboot to complete installation"
