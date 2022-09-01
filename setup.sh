#!/bin/bash
# Create user root and chain
cp airootfs/etc/passwd airootfs/etc/passwd.bak
cat > airootfs/etc/passwd << EOF
root:x:0:0:root:/root:/bin/bash
chain:x:1000:1000:chain:/home/chain:/bin/bash
EOF
# Specify groups
cp airootfs/etc/group airootfs/etc/group.bak
cat > airootfs/etc/group << EOF
root:x:0:root
chain:x:1000:chain
wheel:x:998:chain
EOF
# SEt password for chain and root to chain
cp airootfs/etc/shadow airootfs/etc/shadow.bak
cat > airootfs/etc/shadow << EOF
root:$6$ko1AGgKtojvbNO63$1b5PVO0GtCU7bsUO6T6EEyRqmMEmLM4PbldV1uI6gA83Fyzr6K3.9Sv5GIBUvIx.YG6BPO8wMypdYwLkz46nd1:14871::::::
davidc:$6$ko1AGgKtojvbNO63$1b5PVO0GtCU7bsUO6T6EEyRqmMEmLM4PbldV1uI6gA83Fyzr6K3.9Sv5GIBUvIx.YG6BPO8wMypdYwLkz46nd1:19146:0:99999:7:::
EOF
# Set hostname
cp airootfs/etc/hostname airootfs/etc/hostname.bak
cat > airootfs/etc/hostname << EOF
chainos
EOF
