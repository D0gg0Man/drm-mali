CC     ?= gcc
CFLAGS ?= -O2 -fPIC -shared -Wall -Wextra \
          -I/usr/include/libdrm \
          -I/usr/include \
          -I/usr/include/android
LDFLAGS ?=
PREFIX  ?= /usr/local
LIBDIR  ?= $(PREFIX)/lib
 
OUT = drm_shim.so
 
.PHONY: all clean install
 
all: $(OUT)
 
$(OUT): drm_ioctl_shim.c
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS) -ldl -lEGL -lgralloc -ldrm
 
install: all
	install -d $(DESTDIR)$(LIBDIR)
	install -m 755 $(OUT) $(DESTDIR)$(LIBDIR)/$(OUT)
 
clean:
	rm -f $(OUT)
