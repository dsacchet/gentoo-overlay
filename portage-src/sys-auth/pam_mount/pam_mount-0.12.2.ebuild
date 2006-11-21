# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-auth/pam_usb/pam_usb-0.3.1.ebuild,v 1.2 2005/09/03 23:29:59 flameeyes Exp $

inherit eutils

DESCRIPTION="A PAM module that enables mount and umount of volume through the login process"
SRC_URI="mirror://sourceforge/pam-mount/${P}.tbz2"
HOMEPAGE="http://pam-mount.sourceforge.net/"

IUSE="pam"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~ppc ~sparc ~alpha ~mips ~amd64"

RDEPEND="sys-libs/pam"
DEPEND="sys-libs/pam"

src_unpack() {
	tar -jxf ${DISTDIR}/${P}.tbz2
}

src_compile() {
	econf || die "conf failed"
	emake || die "make failed"
}

src_install() {
	insinto /lib/security
	insopts -m0755
	doins src/.libs/pam_mount.so
	insopts -m0744
	doins src/pam_mount.la
	doins src/.libs/pam_mount.a
	dosym /lib/security/pam_mount.so /lib/security/pam_mount_auth.so
	dosym /lib/security/pam_mount.so /lib/security/pam_mount_session.so
	insinto /etc/security
	insopts -m0644
	doins ${FILESDIR}/pam_mount.conf
	insinto /usr/sbin
	insopts -m0755
	doins src/pmvarrun
	insinto /usr/bin
	insopts -m0755
	doins scripts/mkehd
	doins scripts/autoehd
	doins scripts/passwdehd
	doins scripts/mount_ehd
	doins scripts/mount.crypt
	doins scripts/umount.crypt
	doman dry/pam_mount.8
}
