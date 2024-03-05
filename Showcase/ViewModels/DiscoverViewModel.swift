import Foundation
import Firebase

class DiscoverViewModel: ObservableObject {
    private var db = Firestore.firestore()
    
    // Function to add a user as a friend
    func addFriend(currentUserID: String, friendID: String) {
        let friendRef = db.collection("users").document(currentUserID).collection("friends").document(friendID)
        
        friendRef.setData(["addedAt": Timestamp(date: Date())]) { error in
            if let error = error {
                print("Error adding friend: \(error.localizedDescription)")
            } else {
                print("Friend added successfully")
            }
        }
    }
}
