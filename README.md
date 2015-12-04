ESP8266-rBoot-skeleton
----------------------

Base project for working with [raburton]s rBoot

Building
--------
Either edit the `Makefile` to point `SDK_BASE` to your `esp_iot_sdk_v1.4.x` 
and `make` or run

```
  SDK_BASE=~/devel/path/esp_iot_sdk_v1.4.0 make
```

Firmwares
---------
If everything is built successfully you should find two binary firmware images
in `src/firmware/`


More info
---------
Check out [raburton-gh]

[raburton]: https://github.com/raburton/esp8266/tree/master/rboot "raburton"
[raburton-gh]: https://github.com/raburton/esp8266/tree/master/rboot "raburton/esp8266"
