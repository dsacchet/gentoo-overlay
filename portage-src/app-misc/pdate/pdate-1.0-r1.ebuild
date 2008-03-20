# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Command line tool to manipulate date"
HOMEPAGE="http://ipaudit.sourceforge.net/ipaudit-web/"
LICENSE="GPL-2"
KEYWORDS="x86 amd64"
IUSE=""
DEPEND="sys-devel/gcc"
RDEPEND=""
SLOT="0"

src_compile() {
	gcc ${FILESDIR}/pdate.c -o ${T}/pdate
}

src_install() {
	dobin ${T}/pdate
}
