import Foundation

/// Singleton to load & hold API keys from Keys.plist
final class KeyManager {
    static let shared = KeyManager()

    /// MapRiot tile‑server API key
    let mapRiotAPIKey: String

    private init() {
        // Locate the Keys.plist in your bundle
        guard
            let url = Bundle.main.url(forResource: "Keys", withExtension: "plist"),
            let data = try? Data(contentsOf: url),
            let dict = try? PropertyListSerialization
                                    .propertyList(from: data,
                                                                options: [],
                                                                format: nil) as? [String: Any],
            let key = dict["MapRiotAPIKey"] as? String,
            !key.isEmpty,
            key != "INSERT_YOUR_API_KEY_HERE"
        else {
            fatalError("""
                ❌ Keys.plist is missing, or MapRiotAPIKey is not set.
                Please duplicate Keys.plist.example → Keys.plist and
                insert your real MapRiotAPIKey in it.
                """)
        }

        mapRiotAPIKey = key
    }
}
