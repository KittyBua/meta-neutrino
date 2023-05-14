FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

PV = "1.32.1"

SRC_URI[tarball.md5sum] = "6273c550ab6a32e8ff545e00e831efc5"
SRC_URI[tarball.sha256sum] = "9d57c4bd33974140fd4111260468af22856f12f5b5ef7c70c8d9b75c712a0dee"

SYSTEMD_SERVICE_${PN} = "telnet.service"

SRC_URI_append += "file://telnet.service \
		   file://telnetd.cfg \
		   file://dos2unix.cfg \
		   file://ether-wake.cfg \
		   file://remove.cfg \
		   file://simple.script \
		   file://resolv.conf \
		   file://ash.cfg \
		   file://wget.cfg \
		   file://ftpd.cfg \
		   file://ftpd.service \
		   file://profile \
"

BUSYBOX_SPLIT_SUID = "0"

do_install_append() {
	install -d ${D}${systemd_unitdir}/system/multi-user.target.wants/
	install -m644 ${WORKDIR}/profile ${D}${sysconfdir}
	install -m644 ${WORKDIR}/telnet.service ${D}${systemd_unitdir}/system/
	ln -sf ${systemd_unitdir}/system/telnet.service ${D}${systemd_unitdir}/system/multi-user.target.wants/telnet.service
	install -m644 ${WORKDIR}/ftpd.service ${D}${systemd_unitdir}/system/
	ln -sf ${systemd_unitdir}/system/ftpd.service ${D}${systemd_unitdir}/system/multi-user.target.wants/ftpd.service
	install -m644 ${WORKDIR}/resolv.conf ${D}/etc/resolv.conf
}

FILES_${PN} += "lib/systemd"
