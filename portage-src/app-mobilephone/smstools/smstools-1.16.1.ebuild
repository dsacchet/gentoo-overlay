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
S=${WORKDIR}/smstools-1

src_compile() {
	econf || die "econf failed"
	emake -s || die "emake failed"
}

src_install() {
	enewgroup sms
	enewuser sms -1 /bin/false /dev/null sms
	pkg_preinst
	dodir /etc/smstools
	touch ${D}/etc/smstools/whitelist
	touch ${D}/etc/smstools/blacklist
	dodir /var/spool/sms
	touch ${D}/var/spool/sms/.keep
	dodir /var/spool/sms/incoming
	touch ${D}/var/spool/sms/incoming/.keep
	dodir /var/spool/sms/outgoing
	touch ${D}/var/spool/sms/outgoing/.keep
	dodir /var/spool/sms/checked
	touch ${D}/var/spool/sms/checked/.keep
	dodir /var/spool/sms/failed
	touch ${D}/var/spool/sms/failed/.keep
	dodir /var/spool/sms/sent
	touch ${D}/var/spool/sms/sent/.keep
	fowners sms:sms /var/spool/sms
	fowners sms:sms /var/spool/sms/incoming
	fowners sms:sms /var/spool/sms/outgoing
	fowners sms:sms /var/spool/sms/checked
	exeinto /etc/init.d
	doexe ${FILESDIR}/smsd
	dosbin bin/smsd
	dobin bin/getsms
	dobin bin/putsms
	dobin scripts/sendsms
	dobin scripts/smsevent
	dobin scripts/smsresend
	insinto /etc/smstools
	newins ${FILESDIR}/smsd.conf smsd.conf
}
