import Foundation
import FirebaseAuth

/// `LoginViewModel` manages the login process, validating user inputs and authenticating via Firebase Authentication.
class LoginViewModel: ObservableObject {
    @Published var email = "" // Stores the user's email address.
    @Published var password = "" // Stores the user's password.
    @Published var errorMessage = "" // Holds any error message that needs to be displayed to the user.
    
    /// Initializes a new instance of the login view model.
    init() {}
    
    /// Attempts to login the user with the provided email and password.
    /// - Parameter completion: A closure that gets called with a `Bool` indicating the success or failure of the login attempt.
    func login(completion: @escaping (Bool) -> Void) {
        // Validates the user input before proceeding.
        guard validate() else {
            completion(false)
            return
        }
        
        // Uses Firebase Authentication to sign in with the provided credentials.
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            DispatchQueue.main.async {
                if let _ = result?.user, error == nil {
                    // Login was successful.
                    completion(true)
                } else {
                    // Login failed, update errorMessage with the error provided by Firebase.
                    self.errorMessage = "Failed to login: \(error?.localizedDescription ?? "")"
                    completion(false)
                }
            }
        }
    }
    
    /// Validates the user's email and password inputs.
    /// - Returns: A `Bool` indicating whether the inputs are valid (`true`) or not (`false`).
    private func validate() -> Bool {
        errorMessage = "" // Resets any previous error message.
        
        // Checks that both email and password fields are non-empty and email is in a valid format.
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields. Thanks!"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email."
            return false
        }
        
        return true // Inputs are valid.
    }
}
