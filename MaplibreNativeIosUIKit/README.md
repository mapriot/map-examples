# MapLibre Native iOS (UIKit)

This is an XCode UIKit project that uses a Swift Package Manager to display a MapRiot MapLibre style. It can be used with any other MapLibre style though.

## Features

- Basic map load
- API‑key URLProtocol (similar to `transformRequest` in Maplibre GL JS)
- Custom attribution button
- Scale bar

## Setup

1) Get a MapRiot API key by writing to us at support@mapriot.com.

2) Create a `Keys.plist` file by copying the `Keys.plist.example` into the same folder.

```bash
cp Keys.plist.example Keys.plist
```

3) Replace `INSERT_YOUR_API_KEY_HERE` in `Keys.plist` with your API key.

4) Open app in XCode and run it.

## Useful links

- [MapLibre Native iOS documentation](https://maplibre.org/maplibre-native/ios/latest/documentation/maplibre) - all APIs and tuorials that will help you get started with MapLibre Native iOS
- [MapLibre Native GitHub](https://github.com/maplibre/maplibre-native) - dig deeper in the code
- [Apple UIKit documentation](https://developer.apple.com/documentation/uikit) - official Apple UIKit documentation
- [MapLibre](https://maplibre.org) - everything MapLibre related
