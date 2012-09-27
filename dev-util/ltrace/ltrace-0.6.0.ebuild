# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit autotools git-2

DESCRIPTION="trace library calls made at runtime"
HOMEPAGE="http://ltrace.alioth.debian.org/"

EGIT_REPO_URI="http://anonscm.debian.org/git/collab-maint/ltrace.git"
EGIT_COMMIT="5f30bc318e430a7c4ea843edeff798e80b5629c9"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86"
IUSE="test"

RDEPEND="dev-libs/elfutils"
DEPEND="${RDEPEND}
        test? ( dev-util/dejagnu )"

src_prepare() {
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" docdir=/usr/share/doc/${PF} install || die
}