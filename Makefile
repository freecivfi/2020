VERSION = 2.6.2.1

all: build

freeciv-$(VERSION).tar.bz2:
	wget "http://files.freeciv.org/stable/freeciv-$(VERSION).tar.bz2"

freeciv-$(VERSION): freeciv-$(VERSION).tar.bz2
	bzcat freeciv-$(VERSION).tar.bz2|tar xf -
	cd freeciv-${VERSION}/ && patch -p1 < ../patches/00-freeciv-2.6.2.1-hmap_shore_level.diff

configure: freeciv-$(VERSION)
	cd freeciv-$(VERSION); ./configure --prefix="${HOME}/opt/freeciv" --enable-debug --disable-client --disable-fcmp --with-readline

build: configure
	make -C freeciv-$(VERSION)

install: build
	make -C freeciv-$(VERSION) install
