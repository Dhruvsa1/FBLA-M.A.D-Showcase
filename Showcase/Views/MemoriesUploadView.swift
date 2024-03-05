import SwiftUI
import UIKit

struct MemoriesUploadView: View {
    @StateObject private var viewModel = MemoriesViewModel() // Instantiate the ViewModel
    @State private var caption: String = ""
    @State private var showImagePicker: Bool = false
    @State private var uiImage: UIImage?
    
    var image: Image? {
        guard let uiImage = uiImage else { return nil }
        return Image(uiImage: uiImage)
    }
    
    var wordCount: Int {
        caption.split { $0 == " " || $0.isNewline }.count
    }
    
    var body: some View {
        VStack {
            Text("Upload Your Memories")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 50) // Add space at the top
            
            Button(action: {
                self.showImagePicker.toggle()
            }) {
                ZStack {
                    Rectangle()
                        .fill(Color.gray.opacity(0.5)) // Gray background for the button
                        .frame(height: 300)
                        .cornerRadius(12) // Rounded corners
                        .overlay(
                            Group {
                                if let image = image {
                                    image
                                        .resizable()
                                        .scaledToFit()
                                } else {
                                    Text("Click here to upload photos & videos")
                                        .foregroundColor(.white)
                                }
                            }
                        )
                    
                }
            }
            .padding(.vertical, 20)
            
            TextField("Enter a caption...", text: $caption)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(12)
                .padding(.vertical, 10)
            
            HStack {
                Text("Word Count: \(wordCount)")
                    .foregroundColor(.gray)
                Spacer()
            }
            
            Spacer()
            
            Button("Post") {
                // Handle the post action using the ViewModel
                viewModel.uploadMemory(image: uiImage, caption: caption)
                // Optionally reset the UI
                caption = ""
                uiImage = nil
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding(.vertical, 10)
            
            Button(action: {
                self.caption = ""
                self.uiImage = nil
            }) {
                Text("I'll do it later")
                    .underline()
                    .foregroundColor(.blue)
            }
            .padding(.bottom, 50) // Add space at the bottom
            
           
        }
        .padding(.horizontal)
        .sheet(isPresented: $showImagePicker) {
            CustomImagePicker(image: self.$uiImage)
        }
    }
}

struct MemoriesUploadView_Previews: PreviewProvider {
    static var previews: some View {
        MemoriesUploadView()
    }
}



struct CustomImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: CustomImagePicker
        
        init(_ parent: CustomImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<CustomImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<CustomImagePicker>) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
