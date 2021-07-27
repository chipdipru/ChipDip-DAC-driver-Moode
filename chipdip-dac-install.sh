#!/bin/sh

echo "Installing ChipDip DACs..."

sudo cp ChipDip-DAC-driver-Moode/snd-soc-chipdip-dac-5.4.ko /lib/modules/`uname -r`/kernel/sound/soc/bcm/snd-soc-chipdip-dac.ko
sudo cp ChipDip-DAC-driver-Moode/chipdip-dac.dtbo /boot/overlays/chipdip-dac.dtbo
sudo depmod

echo "Reboot to complete installation"
