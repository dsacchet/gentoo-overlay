# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Set of script to make easier the managment of several gentoo servers"
HOMEPAGE="http://www.ouba.org/opensource"
SRC_URI="http://www.ouba.org/opensource/distfiles/${P}.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="x86"
IUSE=""

DEPEND="app-forensics/chkrootkit
	virtual/mta
	virtual/cron"

S=${WORKDIR}/${P}

src_install() {
	exeinto /etc/cron.daily
	doexe scripts/clean-gentoo
	doexe scripts/firewall-gentoo
	doexe scripts/security-gentoo
	doexe scripts/update-gentoo
	exeinto /etc/cron.hourly
	doexe scripts/diskspace-gentoo
	insinto /etc/conf.d
	doins scripts/server-tools
}