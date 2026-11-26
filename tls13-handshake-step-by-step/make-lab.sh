#!/usr/bin/env bash
# TLS & PKI in Practice: a FICTIONAL test PKI and two test sites, for learning only.
#   bash make-lab.sh DIR
# In DIR:
#   ca.crt          Example Root CA: the trust anchor (it signs itself)
#   issuing-ca.crt  Example Issuing CA: signed by the root, signs the sites
#   shop.crt        shop.example + www.shop.example   (the server also sends issuing-ca.crt)
#   shoppe.crt      shoppe.example, a look-alike name signed by the same CA
# Private keys stay in DIR/.keys and are never shown. Never reuse them anywhere.
set -euo pipefail
d="${1:?usage: bash make-lab.sh DIR}"
mkdir -p "$d/.keys"
cd "$d"

key() { openssl genpkey -algorithm EC -pkeyopt ec_paramgen_curve:P-256 -out ".keys/$1.key" 2>/dev/null; }

# sign NAME "CN" ISSUER DAYS EXTENSIONS
sign() {
  local name=$1 cn=$2 issuer=$3 days=$4 ext=$5
  key "$name"
  openssl req -new -key ".keys/$name.key" -subj "/CN=$cn" -out ".keys/$name.csr"
  printf '%b\n' "$ext" > ".keys/$name.ext"
  if [ "$issuer" = self ]; then
    openssl x509 -req -in ".keys/$name.csr" -key ".keys/$name.key" -days "$days" \
      -extfile ".keys/$name.ext" -out "$name.crt" 2>/dev/null
  else
    openssl x509 -req -in ".keys/$name.csr" -CA "$issuer.crt" -CAkey ".keys/$issuer.key" \
      -days "$days" -extfile ".keys/$name.ext" -out "$name.crt" 2>/dev/null
  fi
}

CA='basicConstraints=critical,CA:true\nkeyUsage=critical,keyCertSign,cRLSign\nsubjectKeyIdentifier=hash'
SITE='basicConstraints=CA:false\nkeyUsage=critical,digitalSignature\nextendedKeyUsage=serverAuth'

sign ca         "Example Root CA"    self       3650 "$CA"
sign issuing-ca "Example Issuing CA" ca         1825 "$CA\nauthorityKeyIdentifier=keyid"
sign shop       shop.example         issuing-ca 90   "$SITE\nsubjectAltName=DNS:shop.example,DNS:www.shop.example"
sign shoppe     shoppe.example       issuing-ca 90   "$SITE\nsubjectAltName=DNS:shoppe.example"
rm -f .keys/*.csr .keys/*.ext .keys/*.srl ./*.srl
echo "test PKI ready in $d"
