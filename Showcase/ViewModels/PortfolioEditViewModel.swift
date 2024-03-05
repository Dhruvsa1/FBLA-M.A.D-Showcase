import Foundation
import Firebase

class PortfolioEditViewModel: ObservableObject {
    @Published var selectedSports: Set<String> = []
    @Published var isCaptain: String = ""
    @Published var clubs: [Club] = []
    @Published var activities: [VolunteeringActivity] = []
    @Published var achievementsAndAwards: [AchievementAndAward] = []
    @Published var experiences: [Experience] = []
    
    private var db = Firestore.firestore()
    
    func saveUserInfo() {
        guard let userID = Auth.auth().currentUser?.uid else {
                   print("Error: No user logged in")
                   return
               }
        // Ensure Firestore is properly configured and userID is obtained, e.g., from Firebase Authentication.
        
        // Save Clubs
        saveCollection(collection: "clubs", documents: clubs.map { $0.asDictionary() }, userID: userID)
        
        // Save Activities
        saveCollection(collection: "activities", documents: activities.map { $0.asDictionary() }, userID: userID)
        
        // Save Achievements and Awards
        saveCollection(collection: "achievementsAndAwards", documents: achievementsAndAwards.map { $0.asDictionary() }, userID: userID)
        
        // Save Experiences
        saveCollection(collection: "experiences", documents: experiences.map { $0.asDictionary() }, userID: userID)
        
        // Optionally, save other user-specific information like selectedSports, isCaptain, etc.
        // This might be saved in a different structure depending on how you want to use it.
    }
    
    private func saveCollection(collection: String, documents: [[String: Any]], userID: String) {
        let userDocRef = db.collection("users").document(userID)
        for document in documents {
            let newDocRef = userDocRef.collection(collection).document()
            newDocRef.setData(document) { error in
                if let error = error {
                    print("Error saving document in \(collection) to Firestore: \(error)")
                } else {
                    print("Document successfully saved in \(collection)")
                }
            }
        }
    }
}
