**drm-mali**
 
LD_PRELOAD shim intercepting DRM ioctls that fail against the Mali DRM
driver on FuriOS. Presentation is handled by Android HWC2; this shim
stubs the DRM path and maintains a dumb KMS framebuffer copy for screen
capture tools.
 
Tested on MT6877 (Dimensity 900, Mali-G68 MC4) running FuriOS.
 
*Pre-built binary*
 
A pre-built aarch64 binary is included as drm_shim.so.
 
*Building from source*
 
```
make
sudo make install LIBDIR=/usr/lib/aarch64-linux-gnu
```
 
*Dependencies*
 
libdrm-dev, libegl-dev, libhybris-dev, libgralloc-dev
 
*Intercepted ioctls*
 
* ADDFB2 (0xb8) -- synthetic fb_ids, gralloc buffers have no real GEM handles
* ATOMIC (0xbc) -- stubbed, HWC2 handles presentation
* AUTH_MAGIC (0x11) -- always succeed
* SETCRTC (0xa2) -- succeed silently
* PAGE_FLIP (0xb0) -- redirect to dumb buffer
 
*See also*
 
* https://github.com/D0gg0Man/libseat-hwcomposer-shim
* https://github.com/D0gg0Man/phosh-hwcomposer-session
* https://github.com/FuriLabs/libdrm-hybris
