#!/bin/bash
set -Eeuo pipefail

chroot /host /root/docker-dump/backup.sh

