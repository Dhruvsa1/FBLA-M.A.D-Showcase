import SwiftUI

struct ExperienceListView: View {
    @Binding var experiences: [Experience]
    
    var body: some View {
        ScrollView {
            
            ForEach($experiences.indices, id: \.self) { index in
                VStack(alignment: .leading) {
                    TextField("Role/Position", text: $experiences[index].role)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 12)
                        .background(Color.white)
                        .cornerRadius(5)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .autocapitalization(.none)

                    TextEditor(text: $experiences[index].description)
                        .padding(4)
                        .frame(minHeight: 60)
                        .background(Color.white)
                        .foregroundColor(.gray)
                        .cornerRadius(5)
                        .autocapitalization(.none)
                }
                .frame(width: 250, height: 200, alignment: .topLeading)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 2, y: 4)
                .overlay(
                    Button {
                        withAnimation {
                            self.removeExperience(at: index)
                        }
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.white)
                            .background(Color.black)
                            .clipShape(Circle())
                            .padding(5)
                    }
                    .offset(x: 15, y: -15),
                    alignment: .topTrailing
                )
                .padding(.trailing, 20)
                .padding([.top, .leading, .bottom])
            }
            .padding(.horizontal)
            
            Button(action: addExperience) {
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("Add Experience")
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.primary)
                .cornerRadius(10)
            }
            .padding()
        }
    }
    
    func addExperience() {
        withAnimation(.default) {
            experiences.append(Experience(role: "", description: "Description"))
        }
    }
    
    func removeExperience(at index: Int) {
        experiences.remove(at: index)
    }
}

// Preview
struct ExperienceListView_Previews: PreviewProvider {
    @State static var previewExperiences: [Experience] = [Experience(role: "Sample Experience", description: "Sample Description")]
    
    static var previews: some View {
        ExperienceListView(experiences: $previewExperiences)
            .previewLayout(.sizeThatFits)
    }
}
