#!/bin/sh

# Script where define environment variables

# krew
echo "export PATH=\"\${KREW_ROOT:-\$HOME/.krew}/bin:\$PATH\"" >> /etc/profile.d/env_krew.sh