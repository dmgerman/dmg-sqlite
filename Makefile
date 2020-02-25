DEFAULT=extension-functions
CC=cc
INSTALL=install
CFLAGS?=
CFLAGS+=$(shell pkg-config --cflags sqlite3 libpcre) -fPIC
LIBS=$(shell pkg-config --libs libpcre)
prefix=
DESTDIR=${HOME}

.PHONY : install clean

extension-functions.so : extension-functions.c
	${CC} -shared -o $@ ${CPPFLAGS} ${CFLAGS} -W extension-functions.c ${LIBS} ${LDFLAGS} -Wl,-z,defs -lm

install : extension-functions.so
	${INSTALL} -pD -m755 pcre.so ${DESTDIR}${prefix}/lib/sqlite3/pcre.so

clean :
	-rm -f pcre.so
