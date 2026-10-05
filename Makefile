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
# $FrauBSD: bhotkeys-screenshot/Makefile 2026-10-05 13:10:57 -0700 Devin Teske $
#
############################################################ PATHS

PREFIX?=	/usr/local
BINDIR?=	${PREFIX}/bin
PLUGDIR?=	${PREFIX}/share/bhotkeys/plugins.d
MANDIR?=	${PREFIX}/share/man/man1

############################################################ FILES

BIN=		bin/desktop-screenshot bin/window-screenshot
PLUG=		shot-desktop shot-greeter shot-window
GREETER=	bin/greeter-screenshot
MAN1=		desktop-screenshot window-screenshot

############################################################ TARGETS

.PHONY: all

all: ${GREETER}

${GREETER}: bin/desktop-screenshot
	ln -sf desktop-screenshot ${.TARGET}

.PHONY: install

install: all
	mkdir -p ${DESTDIR}${BINDIR} ${DESTDIR}${PLUGDIR} \
	    ${DESTDIR}${MANDIR}
	install -m 755 ${BIN} ${DESTDIR}${BINDIR}
	ln -sf desktop-screenshot ${DESTDIR}${BINDIR}/greeter-screenshot
.for p in ${PLUG}
	install -m 644 plugins.d/${p} ${DESTDIR}${PLUGDIR}/${p}
.endfor
.for m in ${MAN1}
	gzip -cn man/${m}.1 > ${DESTDIR}${MANDIR}/${m}.1.gz
	chmod 444 ${DESTDIR}${MANDIR}/${m}.1.gz
.endfor
	ln -sf desktop-screenshot.1.gz \
	    ${DESTDIR}${MANDIR}/greeter-screenshot.1.gz

.PHONY: clean

clean:
	rm -f ${GREETER}

################################################################################
# END
################################################################################
