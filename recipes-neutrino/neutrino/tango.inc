include neutrino-common-vars.inc

HOMEPAGE = "https://github.com/TangoCash"
MAINTAINER = "TangoCash"

SRC_URI_append += "git://github.com/TangoCash/neutrino-tangos.git;protocol=https \
"

PV = "${FLAVOUR}-git${SRCPV}"

EXTRA_OECONF_append += " \
			--enable-reschange \
                        --with-boxtype=${MACHINE} \
"
