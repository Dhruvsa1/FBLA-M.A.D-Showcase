import Foundation
import Firebase
import FirebaseStorage
import FirebaseFirestore
import UIKit

class MemoriesViewModel: ObservableObject {
    private var db = Firestore.firestore()
    private var storage = Storage.storage()

    // Function to upload an image and save memory data under a specific user
    func uploadMemory(image: UIImage?, caption: String) {
        guard let userID = Auth.auth().currentUser?.uid else {
            print("User not logged in")
            return
        }
        
        guard let image = image, let imageData = image.jpegData(compressionQuality: 0.8) else {
            print("Could not convert image to Data")
            return
        }
        
        let imagePath = "images/\(userID)/\(UUID().uuidString).jpg"
        let imageRef = storage.reference().child(imagePath)
        
        imageRef.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                print("Upload error: \(error.localizedDescription)")
                return
            }
            
            imageRef.downloadURL { [weak self] url, error in
                guard let self = self, let downloadURL = url else {
                    print("Error getting download URL: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }
                
                let newMemory = Memory(caption: caption, imageUrl: downloadURL.absoluteString)
                self.saveMemoryData(userID: userID, memory: newMemory)
            }
        }
    }

    private func saveMemoryData(userID: String, memory: Memory) {
        let userMemoriesRef = db.collection("users").document(userID).collection("memories")
        userMemoriesRef.addDocument(data: memory.asDictionary()) { error in
            if let error = error {
                print("Error saving memory data: \(error.localizedDescription)")
            } else {
                print("Memory saved successfully")
            }
        }
    }
}
