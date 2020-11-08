all: build

freeciv-2.6.2.tar.bz2:
	wget "http://files.freeciv.org/stable/freeciv-2.6.2.tar.bz2"

freeciv-2.6.2:
	bzcat freeciv-2.6.2.tar.bz2|tar xf -

configure: freeciv-2.6.2
	cd freeciv-2.6.2; ./configure --prefix="${HOME}/opt/freeciv" --enable-debug --disable-client --disable-fcmp --with-readline

build: configure
	make -C freeciv-2.6.2

install: build
	make -C freeciv-2.6.2 install
