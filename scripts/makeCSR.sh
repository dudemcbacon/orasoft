#!/bin/bash
#
# makeCSR.sh -- Create an Oracle Wallet and request a CSR from it.
#
#   Usage: makeCSR.sh <hostname>
#
ORAPKI=/orasoft/product/middleware/oracle_common/bin/orapki
HOSTNAME=$1
DN_STRING="CN=${HOSTNAME}.usace.army.mil,OU=USA,OU=PKI,OU=DoD,O=U.S. Government,C=US"

die() {
  echo >&2 "$@"
  exit 1
}

[ "$#" -eq 1 ] || die "Missing hostname."
[ ! -d $HOSTNAME ] || die "Wallet directory already exists."

read -s -p "Enter wallet password: " WALLETPW
echo ""
[ "${#WALLETPW}" -ge "8" ] || die "Password must be eight characters or longer."

echo "Creating wallet for $HOSTNAME..."
$ORAPKI wallet create -wallet $HOSTNAME -auto_login -pwd $WALLETPW 1>/dev/null
echo "Adding key for $HOSTNAME..."
$ORAPKI wallet add -wallet $HOSTNAME -dn "$DN_STRING" -keysize 2048 -pwd $WALLETPW 1>/dev/null
echo "Exporting certificate request as ${HOSTNAME}.csr..."
$ORAPKI wallet export -wallet $HOSTNAME -dn "$DN_STRING" -request ${HOSTNAME}.csr -pwd $WALLETPW 1>/dev/null
