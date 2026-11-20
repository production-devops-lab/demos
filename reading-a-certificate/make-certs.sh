#!/usr/bin/env bash
# HTTPS and Certificates, Simply: FICTIONAL test certificates, for learning only.
#   bash make-certs.sh DIR
# In DIR:
#   root-ca.crt     Example Root CA: the top office (it signs itself)
#   test-ca.crt     Example Test CA: signed by Example Root CA
#   shop.crt        shop.example (and www.shop.example), signed by Example Test CA
#   site1.crt .. site4.crt   four certificates to check (lesson 7)
# The keys stay in DIR/.ca and are never shown. Fixed dates: the same output at every run.
set -euo pipefail
d="${1:?usage: bash make-certs.sh DIR}"
mkdir -p "$d/.ca"
cd "$d"
: > .ca/index.txt
cat > .ca/ca.cnf <<'EOF'
[ ca ]
default_ca = lab
[ lab ]
database = .ca/index.txt
new_certs_dir = .ca
rand_serial = yes
default_md = sha256
policy = any
unique_subject = no
[ any ]
commonName = supplied
[ office ]
basicConstraints = critical, CA:true
keyUsage = critical, keyCertSign, cRLSign
subjectKeyIdentifier = hash
[ site ]
basicConstraints = CA:false
keyUsage = critical, digitalSignature
extendedKeyUsage = serverAuth
subjectAltName = ${ENV::NAMES}
EOF
export NAMES=DNS:unused

# make NAME "COMMON NAME" ISSUER EXTENSIONS START END [SAN]
# a new key and a request for NAME, signed by ISSUER (self = signs itself), valid from START to END
make() {
  local name=$1 cn=$2 issuer=$3 ext=$4 start=$5 end=$6
  NAMES=${7:-DNS:$cn}
  openssl genpkey -algorithm EC -pkeyopt ec_paramgen_curve:P-256 -out ".ca/$name.key" 2>/dev/null
  openssl req -new -key ".ca/$name.key" -subj "/CN=$cn" -out ".ca/$name.csr"
  if [ "$issuer" = self ]; then
    openssl ca -batch -notext -config .ca/ca.cnf -selfsign -keyfile ".ca/$name.key" \
      -extensions "$ext" -startdate "$start" -enddate "$end" -in ".ca/$name.csr" -out "$name.crt" 2>/dev/null
  else
    openssl ca -batch -notext -config .ca/ca.cnf -cert "$issuer.crt" -keyfile ".ca/$issuer.key" \
      -extensions "$ext" -startdate "$start" -enddate "$end" -in ".ca/$name.csr" -out "$name.crt" 2>/dev/null
  fi
}

make root-ca  "Example Root CA" self    office 20260101000000Z 20451231000000Z
make test-ca  "Example Test CA" root-ca office 20260101000000Z 20351231000000Z
make shop     shop.example      test-ca site   20261101000000Z 20271031000000Z "DNS:shop.example,DNS:www.shop.example"
make site1    shop.example      test-ca site   20260801000000Z 20261030000000Z   # expired
make site2    blog.example      test-ca site   20261101000000Z 20271031000000Z   # someone else's name
make site3    shop.example      self    site   20261101000000Z 20271031000000Z   # signed by itself
make site4    shop.example      test-ca site   20271201000000Z 20281130000000Z   # not valid yet
rm -f .ca/*.csr .ca/*.pem
echo "test certificates ready in $d"
