############################################################ LICENSE
#
# SPDX-License-Identifier: BSD-2-Clause
#
# Copyright (c) 2026 Devin Teske <dteske@FreeBSD.org>
#
############################################################ IDENT(1)
#
# $Title: bhotkeys-screenshot - Print and Alt+Print $
# $Copyright: 2026 Devin Teske. All rights reserved. $
# $FrauBSD: bhotkeys-screenshot/Makefile 2026-10-04 11:45:21 -0700 Devin Teske $
#
############################################################ PATHS

PREFIX?=	/usr/local
BINDIR?=	${PREFIX}/bin
PLUGDIR?=	${PREFIX}/share/bhotkeys/plugins.d

############################################################ FILES

BIN=		bin/desktop-screenshot bin/window-screenshot
PLUG=		shot-desktop shot-greeter shot-window
GREETER=	bin/greeter-screenshot

############################################################ TARGETS

.PHONY: all

all: ${GREETER}

${GREETER}: bin/desktop-screenshot
	ln -sf desktop-screenshot ${.TARGET}

.PHONY: install

install: all
	mkdir -p ${DESTDIR}${BINDIR} ${DESTDIR}${PLUGDIR}
	install -m 755 ${BIN} ${DESTDIR}${BINDIR}
	ln -sf desktop-screenshot ${DESTDIR}${BINDIR}/greeter-screenshot
.for p in ${PLUG}
	install -m 644 plugins.d/${p} ${DESTDIR}${PLUGDIR}/${p}
.endfor

.PHONY: clean

clean:
	rm -f ${GREETER}

################################################################################
# END
################################################################################
