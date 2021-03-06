# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
#!/bin/bash

EAPI=6

inherit cmake-utils vcs-snapshot

DESCRIPTION="Small mutt carddav search utility for your Owncloud or SOGo server"
HOMEPAGE="https://github.com/BlackIkeEagle/muttvcardsearch"
SRC_URI="https://github.com/BlackIkeEagle/muttvcardsearch/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-db/sqlite
	net-misc/curl"
RDEPEND="${DEPEND}"

src_install() {
	cmake-utils_src_install

	newman manual/${PN}.man ${PN}.1
}
