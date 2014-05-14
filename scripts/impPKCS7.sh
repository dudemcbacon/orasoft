#!/bin/bash
#
# impPKCS7.sh -- Import raw PKCS7 formatted certificate into existing Oracle Wallet
#
#   Usage: impPKCS7.sh <wallet_directory>
#
ORAPKI=/orasoft/product/middleware/oracle_common/bin/orapki
WALLET=$1

die() {
  echo >&2 "$@"
  exit 1
}

[ "$#" -eq 1 ] || die "Missing wallet name."
[ -d $WALLET ] || die "Wallet directory does not exist."
[ -f ${WALLET}.pkcs7 ] || die "PKCS7 file does not exist."

read -s -p "Enter wallet password: " walletpw
echo "Importing PKCS7 into ${WALLET}..."

$ORAPKI wallet add -wallet $WALLET -user_cert -cert ${WALLET}.pkcs7 -pwd ${WALLET}
$ORAPKI wallet display -wallet $WALLET
