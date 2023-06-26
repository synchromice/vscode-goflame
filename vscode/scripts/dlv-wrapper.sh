#!/usr/bin/env bash
# Copyright 2022 RnD Center "ELVEES", JSC
#
# GO Delve debugger wrapper.
#
# Log messages are stored into file:///var/tmp/go-wrapper.log

set -euo pipefail

# Include Golang environment
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source "${SCRIPT_DIR}/go-runtime.sh"
xmessage_source "dlv-wrapper"

xdebug "Dlv Args: $*"
xprint_export "${GOLANG_EXPORTS[@]}"

xflash_pending_commands
xexec "${LOCAL_DLVBIN}" "$@"
xexit
