import Foundation
import Firebase

class AcademicUserInfoViewModel: ObservableObject {
    @Published var courses: [Course] = []
    @Published var gpa: GPA = GPA()
    @Published var satact: SATACT =  SATACT()

    private var db = Firestore.firestore()

    func saveAcademicInfo() {
        guard let userID = Auth.auth().currentUser?.uid else {
            print("Error: No user logged in")
            return
        }

        // Save Courses
        saveCollection(collection: "courses", documents: courses.map { $0.asDictionary() }, userID: userID)
        
        // Save GPA
        saveGPA(gpa: gpa.asDictionary(), userID: userID)
        
        saveSATACT(gpa: satact.asDictionary(), userID: userID)
        
        updateSetUpDoneField(userID: userID)
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

    private func saveGPA(gpa: [String: Any], userID: String) {
        let userDocRef = db.collection("users").document(userID)
        // Saving GPA as a single document within a 'gpa' subcollection
        userDocRef.collection("gpa").document("details").setData(gpa) { error in
            if let error = error {
                print("Error saving GPA to Firestore: \(error)")
            } else {
                print("GPA successfully saved")
            }
        }
    }
    
    private func saveSATACT(gpa: [String: Any], userID: String) {
        let userDocRef = db.collection("users").document(userID)
        // Saving GPA as a single document within a 'gpa' subcollection
        userDocRef.collection("satact").document("details").setData(gpa) { error in
            if let error = error {
                print("Error saving SATACT to Firestore: \(error)")
            } else {
                print("SATACT successfully saved")
            }
        }
    }
    
    
    private func updateSetUpDoneField(userID: String) {
          let userDocRef = db.collection("users").document(userID)
          userDocRef.updateData(["setUpDone": true]) { error in
              if let error = error {
                  print("Error updating setUpDone field: \(error)")
              } else {
                  print("setUpDone field successfully updated to true")
              }
          }
      }

}
