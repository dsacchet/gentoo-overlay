# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Command line tool to manage set of passwords"
HOMEPAGE="http://passwordms.sourceforge.net/"
SRC_URI="http://www.ouba.org/opensource/distfiles/${P}.tar.gz"
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="x86"
IUSE=""
DEPEND="sys-libs/ncurses <dev-libs/cdk-5"
RDEPEND="${DEPEND}"

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	einstall || die "einstall failed"
}
