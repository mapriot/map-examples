import UIKit
import MapLibre

class ViewController: UIViewController, MLNMapViewDelegate {

    var mapView: MLNMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Build style URL with apiKey parameter
        let apiKey = KeyManager.shared.mapRiotAPIKey
        let styleURLString = "https://api.mapriot.com/styles/outdoor.json?apiKey=\(apiKey)"
        guard let styleURL = URL(string: styleURLString) else {
            fatalError("Invalid style URL: \(styleURLString)")
        }

        // Instantiate the mapView with styleURL
        mapView = MLNMapView(frame: view.bounds, styleURL: styleURL)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.delegate = self

        // Hide default logo and attribution
        mapView.logoView.isHidden = true
        mapView.attributionButton.isHidden = true

        // Show metric scale
        mapView.showsScale = true
        mapView.scaleBarUsesMetricSystem = true
        mapView.scaleBarPosition = MLNOrnamentPosition.bottomLeft

        view.addSubview(mapView)

        // Add custom "ⓘ" attribution button
        let infoButton = UIButton(type: .system)
        infoButton.setTitle("ⓘ", for: .normal)
        infoButton.backgroundColor = .white
        infoButton.setTitleColor(.black, for: .normal)
        infoButton.layer.cornerRadius = 16
        infoButton.titleLabel?.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        infoButton.translatesAutoresizingMaskIntoConstraints = false

        // Open attributition sheet on button click
        infoButton.addTarget(self,
                             action: #selector(showAttributionSheet),
                             for: .touchUpInside)

        view.addSubview(infoButton)

        // Place attribution to the right corner
        NSLayoutConstraint.activate([
            infoButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12),
            infoButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            infoButton.widthAnchor.constraint(equalToConstant: 32),
            infoButton.heightAnchor.constraint(equalToConstant: 32),
        ])
    }

    // Shows an attribute sheet with proper attribution
    @objc private func showAttributionSheet() {
        let alert = UIAlertController(title: "Map attribution",
                                      message: nil,
                                      preferredStyle: .actionSheet)

        // MapRiot link
        alert.addAction(UIAlertAction(title: "© MapRiot.com", style: .default) { _ in
            UIApplication.shared.open(URL(string: "https://mapriot.com/copyright")!)
        })

        // OSM link
        alert.addAction(UIAlertAction(title: "© OpenStreetMap contributors", style: .default) { _ in
            UIApplication.shared.open(URL(string: "https://www.openstreetmap.org/copyright")!)
        })

        // Cancel button
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        // Present alert
        present(alert, animated: true)
    }

    // MLNMapViewDelegate callback when the style is fully loaded
    func mapView(_ mapView: MLNMapView, didFinishLoading style: MLNStyle) {
        // Map is ready — you can now add annotations, layers, etc.
        print("✅ Style loaded, map is ready!")
    }

}
