import FirebaseAuth
import Foundation
import FirebaseFirestore

/// `RegisterViewModel` is a class responsible for handling user registration logic within the "To Do List" app. It manages the state and interaction data required for a user to register, including form fields for personal information and validation states.
class RegisterViewModel: ObservableObject {
    @Published var fname = ""
    @Published var lname = ""
    @Published var username = ""
    @Published var password = ""
    @Published var email = ""
    @Published var phoneNumber = ""
    @Published var address = ""
    @Published var setUpDone = false
    @Published var birthday = Date()
    @Published var errorMessage: String = ""
    @Published var showAlert = false
    @Published var success = false
    
    /// Initializes a new instance of the view model.
    init() {}
    
    /// Handles the registration process by first validating user input and then creating a new user account with Firebase Authentication and Firestore.
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userID = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userID)
        }
    }
    
    /// Inserts a new user record into Firestore with the provided user ID and other registration details.
    private func insertUserRecord(id: String) {
        let newUser = User(id: id, fname: fname, lname: lname, username: username, password: password, email: email, phoneNumber: phoneNumber, address: address, setUpDone: false, birthday: birthday)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
        success = true
    }
    
    /// Validates the user input across all registration fields, updating the state with any validation errors.
    func validate() -> Bool {
        errorMessage = ""
        showAlert = false
        success = false
            
        // Validates first and last name
        if fname.trimmingCharacters(in: .whitespaces).isEmpty {
            errorMessage = "First name is required."
            showAlert = true
            return false
        }
        
        if lname.trimmingCharacters(in: .whitespaces).isEmpty {
            errorMessage = "Last name is required."
            showAlert = true
            return false
        }
        
        // Validates email
        if !isValidEmail(email) {
            errorMessage = "Please enter a valid email address."
            showAlert = true
            return false
        }
        
        // Validates password
        if !isValidPassword(password) {
            errorMessage = "Password must be at least 8 characters long, include a mix of uppercase and lowercase letters, a number, and a special character."
            showAlert = true
            return false
        }
        
        // Validates username
        if username.trimmingCharacters(in: .whitespaces).isEmpty || username.count < 3 {
            errorMessage = "Username must be at least 3 characters long."
            showAlert = true
            return false
        }
        
        // Validates phone number
        if !isValidPhoneNumber(phoneNumber) {
            errorMessage = "Please enter a valid phone number."
            showAlert = true
            return false
        }
        
        // Validates age based on birthday
        if !isAtLeast14YearsOld(birthday) {
            errorMessage = "You must be at least 14 years old to register."
            showAlert = true
            return false
        }
        
        return true
    }
    
    /// Validates an email address using a regular expression.
    private func isValidEmail(_ email: String) -> Bool {
        let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailPattern)
        return emailPredicate.evaluate(with: email)
    }
    
    /// Validates a password using a regular expression to ensure it meets specific complexity requirements.
    private func isValidPassword(_ password: String) -> Bool {
        let passwordPattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordPattern)
        return passwordPredicate.evaluate(with: password)
    }
    
    /// Validates a phone number using a regular expression.
    private func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
        let phonePattern = "^[0-9+]{0,1}[0-9]{5,16}$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phonePattern)
        return phonePredicate.evaluate(with: phoneNumber)
    }
    
    /// Checks if the user is at least 14 years old based on the provided birthday.
    private func isAtLeast14YearsOld(_ birthday: Date) -> Bool {
        let calendar = Calendar.current
        let now = Date()
        let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
        guard let age = ageComponents.year else { return false }
        return age >= 14
    }
}
