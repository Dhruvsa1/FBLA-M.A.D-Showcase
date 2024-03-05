import SwiftUI

struct ExperiencesView: View {
    @State private var selectedCategory = "Clubs"

    var categories = ["Clubs", "Work", "Service", "Other"]
    var experiences = [
        ("Internationally Genetically Engineered Machine (iGEM)", "Synthetic biology research", Color.black),
        ("FIRST Robotics", "Manufacturing and Design", Color.orange),
        ("NGSS", "Manufacturing and Design", Color.black)
    ]
    
    var experiences1 = [
        ("Dhalia Education", "Built website", Color.black),
        ("KKTutors", "Developed Website", Color.orange),
    ]
    
    var experiences2 = [
        ("Ascend", "Volunteered to help with special education students", Color.black),
      
    ]
    
    var experiences3 = [
        ("Internationally Genetically Engineered Machine (iGEM)", "Synthetic biology research", Color.black),
        ("FIRST Robotics", "Manufacturing and Design", Color.orange),
        ("NGSS", "Manufacturing and Design", Color.black)
    ]


    var body: some View {
        VStack(alignment: .leading) {
            // Title
            Text("Experiences")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
                .padding(.leading, 5)

            // Category Picker
            Picker("Select Category", selection: $selectedCategory) {
                ForEach(categories, id: \.self) { category in
                    Text(category).tag(category)
                }
            }
            .padding(.leading, -15)
            .frame(width: 300)
            
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            if selectedCategory == "Clubs" {
                ForEach(experiences, id: \.0) { experience in
                    ExperienceCard(title: experience.0, subtitle: experience.1, backgroundColor: experience.2)
                }
            } else if selectedCategory == "Work" {
                ForEach(experiences1, id: \.0) { experience in
                    ExperienceCard(title: experience.0, subtitle: experience.1, backgroundColor: experience.2)
                }
            }  else if selectedCategory == "Service" {
                ForEach(experiences2, id: \.0) { experience in
                    ExperienceCard(title: experience.0, subtitle: experience.1, backgroundColor: experience.2)
                }
            } else if selectedCategory == "Other" {
                ForEach(experiences3, id: \.0) { experience in
                    ExperienceCard(title: experience.0, subtitle: experience.1, backgroundColor: experience.2)
                }
            }


            Spacer()
        }
        .frame(minHeight: 500)
        
    }
}

struct ExperienceCard: View {
    var title: String
    var subtitle: String
    var backgroundColor: Color

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.7))
            }
            .padding()

            Spacer()

            Button(action: {
                // Action for adding or editing the experience
            }) {
                Image(systemName: "plus")
                    .foregroundColor(.white)
            }
            .padding()
        }
        .frame(width: 325)
        .background(backgroundColor)
        .cornerRadius(12)
        .padding(.leading, 5)
        .padding(.vertical, 4)
    }
}

struct ExperiencesView_Previews: PreviewProvider {
    static var previews: some View {
        ExperiencesView()
    }
}
