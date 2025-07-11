import UIKit
import MapLibre

class ViewController: UIViewController, MLNMapViewDelegate {

    var mapView: MLNMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // 1. Build your style URL with apiKey parameter
        let apiKey = KeyManager.shared.mapRiotAPIKey
        let styleURLString = "https://api.mapriot.com/styles/outdoor.json?apiKey=\(apiKey)"
        guard let styleURL = URL(string: styleURLString) else {
            fatalError("Invalid style URL: \(styleURLString)")
        }

        // 2. Instantiate the mapView with your styleURL
        mapView = MLNMapView(frame: view.bounds, styleURL: styleURL)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.delegate = self

        // 3. Add to view hierarchy
        view.addSubview(mapView)
    }

  // MLNMapViewDelegate callback when the style is fully loaded
    func mapView(_ mapView: MLNMapView, didFinishLoading style: MLNStyle) {
        // Map is ready — you can now add annotations, layers, etc.
        print("✅ Style loaded, map is ready!")
    }

}
