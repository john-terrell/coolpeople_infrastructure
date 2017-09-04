#
# Copy and paste the lines below to install the 64-bit set.
#
BOOTSTRAP_TAR="bootstrap-2017Q2-x86_64.tar.gz"
BOOTSTRAP_SHA="76395983001441108c3ca3ed77d6e071387cc2f5"

# Download the bootstrap kit to the current directory.
curl -k -O https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/${BOOTSTRAP_TAR}

# Verify the SHA1 checksum.
[ "${BOOTSTRAP_SHA}" = "$(/bin/digest -a sha1 ${BOOTSTRAP_TAR})" ] || echo "ERROR: checksum failure"

# Verify PGP signature.  This step is optional, and requires gpg.
curl -k -O https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/${BOOTSTRAP_TAR}.asc
curl -k -sS https://pkgsrc.joyent.com/pgp/DE817B8E.asc | gpg --import
gpg --verify ${BOOTSTRAP_TAR}{.asc,}

# Install bootstrap kit to /opt/local
tar -zxpf ${BOOTSTRAP_TAR} -C /

# Add to PATH/MANPATH.
PATH=/opt/local/sbin:/opt/local/bin:$PATH
MANPATH=/opt/local/man:$MANPATH
