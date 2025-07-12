# MapRiot map tiles example apps

MapRiot provides beautiful outdoor map tiles built using the wonderful [Open Street Map](https://openstreetmap.org) database, enhanced by locally available data, available for online and offline use.

![MapRiot devices mockup](/assets/mapriot-devices-mockup.png)

You can find sample apps that integrate MapRiot vector map tiles in this repository. If we are missing an integration, either let us know through a GitHub issue or send an e-mail to support@mapriot.com.

## Testing and API Keys

If you're interested in integrating our map tiles, you will need to obtain an API key. We can provide an API key for testing purposes for free. Let us know at support@mapriot.com. We don't have public pricing and we discuss each customer use case separately.

## Online demo

You can browse our interactive map at [https://mapriot.com/map](https://mapriot.com/map) without registration.

## Example apps

| Platform / Library                                          | Integration Method                                                 | Features                                                                                                                                  |     |
| ----------------------------------------------------------- | ------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------- | --- |
| [MapLibre Native iOS (UIKit)](/MaplibreNativeIosUIKit/)     | Swift (Swift Package Manager)                                      | • Basic map load<br>• API‑key URLProtocol (similar to `transformRequest` in Maplibre GL JS)<br>• Custom attribution button<br>• Scale bar |
| [MapLibre Native iOS (SwiftUI)](/MaplibreNativeIosSwiftUI/) | Swift ([MapLibreSwiftUI](https://github.com/maplibre/swiftui-dsl)) | • **NOT WORKING YET**<br>• Basic map load                                                                                                 |
| MapLibre Native Android                                     | _coming soon_                                                      |                                                                                                                                           |     |
| Web (MapLibre GL JS)                                        | _coming soon_<br>[online demo](https://mapriot.com/map/)           |                                                                                                                                           |     |
| Web (Leaflet)                                               | _coming soon_                                                      |                                                                                                                                           |     |

## License

This project's code samples are licensed under the MIT License. See [LICENSE](LICENSE.md) for details.
**Note:**
All MapRiot brand assets, including logos and images, are **not** included under the MIT License and may **not** be used without prior written permission. To use MapRiot map tiles or branding, please contact us at [support@mapriot.com](mailto:support@mapriot.com).
