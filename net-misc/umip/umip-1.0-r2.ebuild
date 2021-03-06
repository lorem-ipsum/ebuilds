# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
#!/bin/bash

EAPI=5

inherit autotools git-2 linux-info

DESCRIPTION="Implementation of Mobile IPv6 and NEMO Basic Support."
HOMEPAGE="http://umip.org"
EGIT_REPO_URI="git://git.umip.org/umip.git"
EGIT_COMMIT="428974c2d0d8e75a2750a3ab0488708c5dfdd8e3"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug +vt"

COMMON_DEPEND="dev-libs/openssl"
DEPEND="${COMMON_DEPEND}
	sys-kernel/linux-headers"
RDEPEND="${COMMON_DEPEND}
	net-misc/radvd
	net-firewall/ipsec-tools[ipv6]"

CONFIG_CHECK="~IPV6_MIP6 ~INET6_XFRM_MODE_ROUTEOPTIMIZATION ~IPV6_TUNNEL ~NET_KEY_MIGRATE ~XFRM_SUB_POLICY"

pkg_setup() {
	linux-info_pkg_setup

	if kernel_is lt 3 8 1 ; then
		ewarn "Your kernel version lacks support for required features."
		ewarn "Upgrade your kernel to a version >= 3.8.1 or apply the patches found at"
		ewarn "http://umip.org/docs/patches/"
	fi
}

src_prepare() {
	eautoreconf

	sed -i src/mk-pmgr_{c,h}.sh\
		-e 's/^indent.*/cp $TMP $OUTFILE/' || die
}

src_configure() {
	econf \
		$(use_enable debug) \
		$(use_enable vt) \
		--without-builtin-crypto
}

src_install() {
	default

	dodoc extras/*.conf
	newinitd "${FILESDIR}"/mip6d.init mip6d
	newconfd "${FILESDIR}"/mip6d.conf mip6d
}
