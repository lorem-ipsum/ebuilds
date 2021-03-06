# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )
inherit distutils-r1

MY_PV="2.0.0.post1"
MY_P="$PN-$MY_PV"

DESCRIPTION="Matrices describing affine transformation of the plane"
HOMEPAGE="https://pypi.python.org/pypi/affine"
SRC_URI="mirror://pypi/a/${PN}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND=""
DEPEND="${RDEPEND}
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

S="$WORKDIR/$MY_P"

python_test() {
	py.test || die
}
