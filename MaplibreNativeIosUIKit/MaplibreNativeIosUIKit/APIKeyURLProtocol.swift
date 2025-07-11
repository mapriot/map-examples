import Foundation

/// Intercepts all HTTP(S) requests, and if they target your tile server
/// and don’t already have your apiKey, appends it as a query parameter.
class APIKeyURLProtocol: URLProtocol {
    private static let handledKey = "APIKeyURLProtocolHandled"
    private var dataTask: URLSessionDataTask?

    /// Decide which requests to intercept:
    override class func canInit(with request: URLRequest) -> Bool {
        guard let url = request.url,
                url.host == "api.mapriot.com" else {
            return false
        }

        // Don’t re‑process a request we’ve already handled
        if URLProtocol.property(forKey: handledKey, in: request) != nil {
            return false
        }

        // If the URL already has an apiKey param, skip it
        if let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
            components.queryItems?.contains(where: { $0.name == "apiKey" }) == true {
            return false
        }

        return true
    }

    /// Leave the request unchanged for caching purposes
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        guard let originalURL = request.url else {
            client?.urlProtocol(self, didFailWithError: URLError(.badURL))
            return
        }

        // Break apart the URL to append our apiKey param
        var components = URLComponents(url: originalURL, resolvingAgainstBaseURL: false)!
        var queryItems = components.queryItems ?? []
        queryItems.append(URLQueryItem(name: "apiKey", value: KeyManager.shared.mapRiotAPIKey))
        components.queryItems = queryItems

        // Create a mutable copy so we can set our “handled” flag
        let mutableRequest = (request as NSURLRequest).mutableCopy() as! NSMutableURLRequest
        mutableRequest.url = components.url

        // Mark it so we don’t re‑enter canInit(_:):
        URLProtocol.setProperty(true,
                                forKey: APIKeyURLProtocol.handledKey,
                                in: mutableRequest)

        // Launch the real network request
        let session = URLSession(configuration: .default,
                                delegate: nil,
                                delegateQueue: nil)
        dataTask = session.dataTask(with: mutableRequest as URLRequest) { data, response, error in
            if let error = error {
            self.client?.urlProtocol(self, didFailWithError: error)
            } else {
            if let resp = response {
                self.client?.urlProtocol(self,
                                        didReceive: resp,
                                        cacheStoragePolicy: .allowed)
            }
            if let data = data {
                self.client?.urlProtocol(self, didLoad: data)
            }
            self.client?.urlProtocolDidFinishLoading(self)
            }
        }
        dataTask?.resume()
    }

    override func stopLoading() {
        dataTask?.cancel()
        dataTask = nil
    }
}
