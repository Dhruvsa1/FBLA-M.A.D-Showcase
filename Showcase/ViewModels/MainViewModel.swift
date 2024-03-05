import Foundation
import FirebaseAuth
import FirebaseFirestore
import SwiftUI

/// `MainViewModel` manages the main application state, including user authentication status, user data fetching, and loading state management.
class MainViewModel: ObservableObject {
    @Published var isLoading: Bool = true // Indicates whether the app is currently loading data.
    @Published var currentUserId: String = "" // Stores the current user's ID if authenticated.
    @Published var setUpDone: Bool? = nil // Tracks whether the user has completed the setup process.
    @Published var user: User? = nil // Holds the current user's data if authenticated and fetched.
   
    /// Fetches the current user's data from Firestore based on their authentication status.
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            DispatchQueue.main.async {
                // Resets user and setup state if no user is logged in.
                self.user = nil
                self.setUpDone = nil
                self.isLoading = false
            }
            return
        }
        
        let db = Firestore.firestore()
        // Retrieves user document from Firestore.
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            DispatchQueue.main.async {
                guard let snapshot = snapshot, error == nil else {
                    // Handles error by resetting state if user data cannot be fetched.
                    self?.user = nil
                    self?.setUpDone = nil
                    self?.isLoading = false
                    return
                }
                if snapshot.exists, let data = snapshot.data() {
                    // Maps the fetched data to a `User` object.
                    self?.user = User(
                        id: data["id"] as? String ?? "",
                        fname: data["fname"] as? String ?? "",
                        lname: data["lname"] as? String ?? "",
                        username: data["username"] as? String ?? "",
                        password: data["password"] as? String ?? "",
                        email: data["email"] as? String ?? "",
                        phoneNumber: data["phoneNumber"] as? String ?? "",
                        address: data["address"] as? String ?? "",
                        setUpDone: data["setUpDone"] as? Bool ?? false,
                        birthday: data["birthday"] as? Date ?? Date())
                    
                    // Updates the setup completion status.
                    self?.setUpDone = self?.user?.setUpDone
                } else {
                    // Resets state if no user data is found.
                    self?.user = nil
                    self?.setUpDone = nil
                }
                self?.isLoading = false // Ends the loading state.
            }
        }
    }

    // Listens for changes in the authentication state to update the app's state accordingly.
    private var handler: AuthStateDidChangeListenerHandle?
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.isLoading = true // Prepares for a potential data fetch.
                if let userId = user?.uid {
                    // Updates current user ID and fetches user data if authenticated.
                    self?.currentUserId = userId
                    self?.fetchUser()
                } else {
                    // Resets the state if no user is authenticated.
                    self?.currentUserId = ""
                    self?.user = nil
                    self?.setUpDone = nil
                    self?.isLoading = false
                }
            }
        }
    }

    /// Checks whether a user is currently signed into the app.
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
