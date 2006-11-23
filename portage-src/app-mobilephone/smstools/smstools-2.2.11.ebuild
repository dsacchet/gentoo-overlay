# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Software to control a GSM to send SMS to mobile phone"
HOMEPAGE="http://smstools.meinemullemaus.de/"
SRC_URI="http://smstools.meinemullemaus.de/packages/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND="dev-libs/mm
        sys-apps/debianutils"
S=${WORKDIR}/smstools/src

src_compile() {
	emake -s || die "emake failed"
}

pkg_preinst() {
	enewgroup sms
	enewuser sms -1 -1 /dev/null sms
}

src_install() {
	dodir /etc/smstools
	touch ${D}/etc/smstools/whitelist
	touch ${D}/etc/smstools/blacklist

	keepdir /var/spool/sms
	keepdir /var/spool/sms/incoming
	keepdir /var/spool/sms/outgoing
	keepdir /var/spool/sms/checked
	keepdir /var/spool/sms/failed
	keepdir /var/spool/sms/sent

	exeinto /etc/init.d
	doexe ${FILESDIR}/smsd
	dosbin bin/smsd
	dobin scripts/sendsms

	insinto /etc/smstools
	newins ${FILESDIR}/smsd.conf smsd.conf
}

pkg_postinst() {
	fowners sms:sms /var/spool/sms
	fowners sms:sms /var/spool/sms/incoming
	fowners sms:sms /var/spool/sms/outgoing
	fowners sms:sms /var/spool/sms/checked
}
