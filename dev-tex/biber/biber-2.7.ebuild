# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils perl-module

DESCRIPTION="A BibTeX replacement for users of biblatex"
HOMEPAGE="http://biblatex-biber.sourceforge.net/ https://github.com/plk/biber/"
SRC_URI="https://github.com/plk/biber/archive/v${PV}.tar.gz  -> ${P}.tar.gz"

LICENSE="|| ( Artistic-2 GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc test"

RDEPEND=">=dev-lang/perl-5.24
	dev-perl/autovivification
	dev-perl/Business-ISBN
	dev-perl/Business-ISMN
	dev-perl/Business-ISSN
	dev-perl/Class-Accessor
	dev-perl/Data-Compare
	dev-perl/Data-Dump
	dev-perl/Data-Uniqid
	dev-perl/DateTime-Calendar-Julian
	dev-perl/DateTime-Format-Builder
	dev-perl/Encode-EUCJPASCII
	dev-perl/Encode-HanExtra
	dev-perl/Encode-JIS2K
	dev-perl/File-Slurp
	dev-perl/IPC-Run3
	dev-perl/libwww-perl[ssl]
	>=dev-perl/Lingua-Translit-0.25
	dev-perl/List-AllUtils
	dev-perl/List-MoreUtils
	dev-perl/Log-Log4perl
	dev-perl/LWP-Protocol-https
	dev-perl/Regexp-Common
	dev-perl/Sort-Key
	>=dev-perl/Text-BibTeX-0.760.0
	dev-perl/Text-CSV
	dev-perl/Text-CSV_XS
	dev-perl/Text-Roman
	dev-perl/URI
	dev-perl/Unicode-LineBreak
	>=virtual/perl-Unicode-Normalize-1.250.0
	>=dev-perl/XML-LibXML-1.70
	dev-perl/XML-LibXML-Simple
	dev-perl/XML-LibXSLT
	dev-perl/XML-Writer
	~dev-tex/biblatex-3.7
	virtual/perl-IPC-Cmd
	>=virtual/perl-Unicode-Collate-1.190.0"
DEPEND="${RDEPEND}
	dev-perl/Config-AutoConf
	dev-perl/Module-Build
	dev-perl/ExtUtils-LibBuilder
	test? ( dev-perl/File-Which
			dev-perl/Test-Differences
			dev-perl/Test-Pod
			dev-perl/Test-Pod-Coverage )"

SRC_TEST="parallel"

PATCHES=( "${FILESDIR}/${PN}-2.7-drop-mozilla-ca.patch" )

src_install(){
	perl-module_src_install
	use doc && dodoc -r doc/*
}

src_test() {
	BIBER_SKIP_DEV_TESTS=1 perl-module_src_test
}
