include config.mk

SCRIPTS = weather internet clock moonphase
all: status

clean:
	@rm -f status-${VERSION}.tar.gz
dist: clean
	@echo creating dist tarball
	@mkdir -p status-${VERSION}
	@cp -R ${SCRIPTS} status-${VERSION}
	@tar -cf status-${VERSION}.tar status-${VERSION}
	@gzip status-${VERSION}.tar
	@rm -rf status-${VERSION}
install:
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@cp -f clock $(DESTDIR)$(PREFIX)/bin
	@cp -f internet $(DESTDIR)$(PREFIX)/bin
	@cp -f moonphase $(DESTDIR)$(PREFIX)/bin
	@cp -f weather $(DESTDIR)$(PREFIX)/bin
	@cp -f status $(DESTDIR)$(PREFIX)/bin
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/{status,clock,internet,moonphase,weather}
uninstall:
	@rm -f $(DESTDIR)$(PREFIX)/bin/{status,clock,internet,moonphase,weather}
.PHONY: all clean dist install uninstall
