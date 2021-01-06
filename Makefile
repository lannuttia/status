include config.mk

SCRIPTS = weather internet clock moonphase
all: dwmstatus

clean:
	@rm -f dwmstatus-${VERSION}.tar.gz
dist: clean
	@echo creating dist tarball
	@mkdir -p dwmstatus-${VERSION}
	@cp -R ${SCRIPTS} dwmstatus-${VERSION}
	@tar -cf dwmstatus-${VERSION}.tar dwmstatus-${VERSION}
	@gzip dwmstatus-${VERSION}.tar
	@rm -rf dwmstatus-${VERSION}
install:
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@cp -f clock $(DESTDIR)$(PREFIX)/bin
	@cp -f internet $(DESTDIR)$(PREFIX)/bin
	@cp -f moonphase $(DESTDIR)$(PREFIX)/bin
	@cp -f weather $(DESTDIR)$(PREFIX)/bin
	@cp -f dwmstatus $(DESTDIR)$(PREFIX)/bin
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/{dwmstatus,clock,internet,moonphase,weather}
uninstall:
	@rm -f $(DESTDIR)$(PREFIX)/bin/{dwmstatus,clock,internet,moonphase,weather}
.PHONY: all clean dist install uninstall
