import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:] ) -> Bool {
        // Confirm that the URL scheme matches your registered scheme
        guard url.scheme == "myapp",
              let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
              let queryItems = components.queryItems else {
            return false
        }
        
        // Look for the authorization code in the URL's query items
        if let code = queryItems.first(where: { $0.name == "code" })?.value {
            // Use this code to exchange for an access token with the Twitter API
            print("Authorization code: \(code)")
        } else if let error = queryItems.first(where: { $0.name == "error" })?.value {
            // Handle any errors here
            print("Authorization error: \(error)")
        }
        
        return true
    }

}
