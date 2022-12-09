# elfgraph does not need to be built, the makefile is provided for integration
# with various packaging systems.
#
# ... or you can use it directly by typing "make install".

SHELL = /bin/sh

INSTALL = install
INSTALL_PROGRAM = $(INSTALL)
INSTALL_DATA = $(INSTALL) -m 644
INSTALL_MAN = $(INSTALL_DATA)
INSTALL_DIR = $(INSTALL) -d

prefix = /usr/local
datarootdir = $(prefix)/share
datadir = $(datarootdir)
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin
libexecdir = $(exec_prefix)/libexec
infodir = $(datarootdir)/info
man1dir = $(datarootdir)/man/man1

all:
	@:

install:
	$(INSTALL_DIR) $(DESTDIR)$(bindir)
	$(INSTALL_PROGRAM) elfgraph $(DESTDIR)$(bindir)
	$(INSTALL_DIR) $(DESTDIR)$(man1dir)
	$(INSTALL_MAN) docs/elfgraph.1 $(DESTDIR)$(man1dir)

uninstall:
	rm -f $(DESTDIR)$(bindir)/elfgraph
	rm -f $(DESTDIR)$(man1dir)/elfgraph.1*

.PHONY: all install uninstall
