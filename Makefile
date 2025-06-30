prefix      ?= /usr/local
bindir      ?= $(prefix)/bin
sysconfdir  ?= /etc/

install-sonbake:
	install -D sonbake/sonbake $(DESTDIR)$(bindir)/sonbake
	install -D sonbake/swss.json $(DESTDIR)$(sysconfdir)/sonbake/swss.json