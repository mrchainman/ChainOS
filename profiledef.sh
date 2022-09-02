#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="chainos"
iso_label="ChainOS_$(date +%Y%m)"
iso_publisher="Mr Chainman <https://github.com/mrchainman/ChainOS>"
iso_application="ChainOS Live CD"
iso_version="$(date +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux.eltorito' 'uefi-x64.systemd-boot.esp' 'uefi-x64.systemd-boot.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/usr/local/bin/"]="0:0:755"
  ["/usr/bin/"]="0:0:755"
  ["/etc/skel/.config/qtile/scripts/"]="0:0:755"
  ["/etc/skel/.config/vifm/scripts/"]="0:0:755"
)
